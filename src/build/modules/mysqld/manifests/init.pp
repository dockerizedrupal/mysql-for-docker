class mysqld {
  require mysqld::packages
  require mysqld::supervisor

  exec { 'mkdir -p /mysqld/data':
    path => ['/bin']
  }

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/mysql/my.cnf',
    mode => 644
  }

  file { '/etc/mysql/conf.d/mysqld_safe_syslog.cnf':
    ensure => absent
  }
}
