class build::mysql::supervisor {
  file { '/etc/supervisor/conf.d/mysql.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/mysql.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/mysql_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/mysql_stdout.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/mysql_stderr.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/mysql_stderr.conf',
    mode => 644
  }
}
