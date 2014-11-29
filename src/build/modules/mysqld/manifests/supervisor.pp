class mysqld::supervisor {
  file { '/etc/supervisor/conf.d/mysqld.conf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/supervisor/conf.d/mysqld.conf',
    mode => 644
  }
}
