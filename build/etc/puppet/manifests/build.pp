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

  exec { 'mkdir -p /mysql-5.5.38/log':
    path => ['/bin']
  }

  exec { 'touch /mysql-5.5.38/log/mysql-slow.log':
    path => ['/usr/bin'],
    require => Exec['mkdir -p /mysql-5.5.38/log']
  }

  exec { 'chown mysql.root /mysql-5.5.38/log/mysql-slow.log':
    path => ['/bin'],
    require => Exec['touch /mysql-5.5.38/log/mysql-slow.log']
  }

  file { '/etc/mysql/conf.d/mysqld_safe_syslog.cnf':
    ensure => absent
  }

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => '/tmp/build/etc/mysql/my.cnf',
    mode => 644
  }

  file { '/etc/logrotate.d/mysql-server':
    ensure => present,
    source => '/tmp/build/etc/logrotate.d/mysql-server',
    mode => 644
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