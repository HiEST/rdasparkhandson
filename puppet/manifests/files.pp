file { '/home/ubuntu/downloads/':
  ensure => 'directory',
  owner  => 'ubuntu',
  group  => 'ubuntu',
}

file { '/home/ubuntu/datasets':
  ensure => 'directory',
  owner  => 'ubuntu',
  group  => 'ubuntu',
}

file { '/home/ubuntu/datasets/donation':
  ensure => 'directory',
  owner  => 'ubuntu',
  group  => 'ubuntu',
  before => Exec['unpack_donation'],
}

file { '/home/ubuntu/datasets/csv_hus':
  ensure => 'directory',
  owner  => 'ubuntu',
  group  => 'ubuntu',
  before => Exec['unpack_csv_hus'],
}

file { '/root/clean_image.sh':
          ensure => present,
          replace => true,
          owner    => 'ubuntu',
          group    => 'ubuntu',          
          mode     => '0755',
          source => "/vagrant/puppet/files/clean_image.sh"
}
 
file { '/etc/apt/apt.conf.d/10periodic':
          ensure => present,
          replace => true,
          owner    => 'ubuntu',
          group    => 'ubuntu',
          mode     => '0644',
          source => "/vagrant/puppet/files/10periodic"
}

wget::fetch {  'spark':
  source      => "https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz",
  destination => '/home/ubuntu/downloads/spark-2.1.1-bin-hadoop2.7.tgz',
  timeout     => 0,
  verbose     => false,
  before      => Exec['unpack_spark'],
}

exec {'unpack_spark':
  unless => 'test -f /home/ubuntu/spark',
  cwd => '/home/ubuntu',
  command => 'tar xzf /home/ubuntu/downloads/spark-2.1.1-bin-hadoop2.7.tgz; mv spark-2.1.1-bin-hadoop2.7 spark; chown -R ubuntu: spark || :',
}

wget::fetch {  'donation':
  source      => "https://archive.ics.uci.edu/ml/machine-learning-databases/00210/donation.zip",
  destination => '/home/ubuntu/downloads/donation.zip',
  timeout     => 0,
  verbose     => false,
  before      => Exec['unpack_donation'],
}

exec {'unpack_donation':
  unless => 'test -f /home/ubuntu/datasets/donation',
  cwd => '/home/ubuntu/datasets/donation',
  command => 'unzip /home/ubuntu/downloads/donation.zip; chown -R ubuntu: * || :',
}

wget::fetch {  'csv_husr':
  source      => "https://www2.census.gov/acs2013_1yr/pums/csv_hus.zip",
  destination => '/home/ubuntu/downloads/csv_hus.zip',
  timeout     => 0,
  verbose     => false,
  before      => Exec['unpack_csv_hus'],
}

exec {'unpack_csv_hus':
  unless => 'test -f /home/ubuntu/datasets/csv_hus',
  cwd => '/home/ubuntu/datasets/csv_hus',
  command => 'unzip /home/ubuntu/downloads/csv_hus.zip; chown -R ubuntu: * || :',
}


file { "/etc/environment":
          ensure => present,
          replace => true,
          owner    => 'root',
          group    => 'root',          
          mode     => '0644',
          source => "/vagrant/puppet/files/environment"
}
