package { 'git':
  ensure => 'installed'
}

if $facts['os']['family'] == 'RedHat' {
  yumrepo { 'ScaleIO_Repo':
    name     => 'scaleio',
    ensure   => 'present',
    baseurl  => 'http://yum.dojo.training/scaleio',
    enabled  => 'true',
    gpgcheck => 'false',
  }
}

Apt::Source <| |> -> Package <| |>

if $facts['os']['family'] == 'Debian' {
  apt::source { 'scaleio':
    comment  => 'ScaleIO Repo',
    location => 'http://apt.dojo.training/scaleio',
    release  => '',
    repos    => './',
    include  => {
      'deb' => true,
    },
    require  => Apt::Conf['DisableGPGChecking'],
  }

  apt::source { 'trusty_main':
    comment      => 'Trusty Repos',
    location     => 'http://gb.archive.ubuntu.com/ubuntu',
    release      => 'trusty',
    repos        => 'universe',
    architecture => 'amd64',
  }

  class { 'apt':
    purge => {
     'sources.list'   => true,
     'sources.list.d' => true,
    }
  }

  apt::conf { 'DisableGPGChecking':
    content => 'APT::Get::AllowUnauthenticated "true";',
    ensure => 'present',
    before => Package['git'],
  }
}
