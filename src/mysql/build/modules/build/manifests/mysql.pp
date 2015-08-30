class build::mysql {
  require build::mysql::packages
  require build::mysql::supervisor

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => 'puppet:///modules/build/etc/mysql/my.cnf',
    mode => 644
  }

  file { '/etc/mysql/conf.d/mysql_safe_syslog.cnf':
    ensure => absent
  }
}
