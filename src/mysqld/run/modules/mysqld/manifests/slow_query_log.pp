class mysqld::slow_query_log {
  file { '/etc/mysql/conf.d/slow_query_log.cnf':
    ensure => present,
    content => template('mysqld/slow_query_log.cnf.erb'),
    mode => 644
  }
}
