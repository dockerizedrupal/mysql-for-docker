class mysqld::supervisor {
  file { '/etc/supervisor/conf.d/mysqld.conf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/supervisor/conf.d/mysqld.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/mysqld_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/supervisor/conf.d/mysqld_stdout.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/mysqld_stderr.conf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/supervisor/conf.d/mysqld_stderr.conf',
    mode => 644
  }
}
