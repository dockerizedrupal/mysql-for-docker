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

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => '/tmp/build/etc/mysql/my.cnf'
  }

  if str2bool("$env_mysql_password") {
    exec { '/bin/bash -c "/etc/init.d/mysql start && echo \"UPDATE mysql.user SET password = PASSWORD(\'%{env_mysql_password}\') WHERE user = \'root\';\" | mysql"': }
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