class run::mysql::innodb_flush_log_at_trx_commit {
  file { '/etc/mysql/conf.d/innodb_flush_log_at_trx_commit.cnf':
    ensure => present,
    content => template('run/innodb_flush_log_at_trx_commit.cnf.erb'),
    mode => 644
  }
}
