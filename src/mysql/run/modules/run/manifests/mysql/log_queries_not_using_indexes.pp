class run::mysql::log_queries_not_using_indexes {
  file { '/etc/mysql/conf.d/log_queries_not_using_indexes.cnf':
    ensure => present,
    content => template('run/log_queries_not_using_indexes.cnf.erb'),
    mode => 644
  }
}
