class build::mysql::supervisor {
  file { '/etc/supervisor/conf.d/mysql.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/mysql.conf',
    mode => 644
  }
}
