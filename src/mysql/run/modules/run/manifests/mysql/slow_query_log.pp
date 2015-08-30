class run::mysql::slow_query_log {
  file { '/etc/mysql/conf.d/slow_query_log.cnf':
    ensure => present,
    content => template('run/slow_query_log.cnf.erb'),
    mode => 644
  }
}
