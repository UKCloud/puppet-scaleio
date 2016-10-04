package { 'git':
  ensure => 'installed'
}

service { 'firewalld.service':
  ensure => 'stopped',
  enable => 'false',
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

# A kernel version that ScaleIO supports is required.
  package { 'linux-image-4.2.0-27-generic':
    ensure => 'installed',
  }

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
    comment      => 'Trusty Main',
    location     => 'http://gb.archive.ubuntu.com/ubuntu',
    release      => 'trusty',
    repos        => 'main universe',
    architecture => 'amd64',
  }

  apt::source { 'trusty_updates':
    comment      => 'Trusty Updates',
    location     => 'http://gb.archive.ubuntu.com/ubuntu',
    release      => 'trusty-updates',
    repos        => 'main universe',
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
