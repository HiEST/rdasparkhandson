exec { 'apt-get update':
  path => '/usr/bin'
}

apt::ppa { 'ppa:webupd8team/java':
            before => Exec['apt-get update']
}

exec {
    'set-licence-selected':
      command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections';

    'set-licence-seen':
      command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections';
}


package { ['curl', 'unzip', 'vim', 'tar', 'oracle-java8-installer']:
  ensure => present,
  require => Exec['apt-get update', 'set-licence-selected', 'set-licence-seen'],
  install_options => ['--allow-unauthenticated'],
}

