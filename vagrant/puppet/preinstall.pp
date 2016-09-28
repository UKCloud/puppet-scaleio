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
