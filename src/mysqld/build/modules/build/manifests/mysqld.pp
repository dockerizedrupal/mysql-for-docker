class build::mysqld {
  require build::mysqld::packages
  require build::mysqld::supervisor

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => 'puppet:///modules/build/etc/mysql/my.cnf',
    mode => 644
  }

  file { '/etc/mysql/conf.d/mysqld_safe_syslog.cnf':
    ensure => absent
  }
}
