class packages {
  package {[
      'mysql-server'
    ]:
    ensure => present
  }
}

class mysql_supervisor {
  file { '/etc/supervisor/conf.d/mysql.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/mysql.conf'
  }
}

class mysql {
  include mysql_supervisor

  exec { 'mkdir -p /mysql-5.5.38/conf.d':
    path => ['/bin']
  }

  exec { 'mkdir -p /mysql-5.5.38/data':
    path => ['/bin']
  }

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => '/tmp/build/etc/mysql/my.cnf'
  }
}

node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages
  include mysql

  Class['packages'] -> Class['mysql']

  exec { 'apt-get update':
    path => ['/usr/bin'],
    before => Class['packages']
  }
}