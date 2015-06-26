class run::mysqld::long_query_time {
  file { '/etc/mysql/conf.d/long_query_time.cnf':
    ensure => present,
    content => template('run/long_query_time.cnf.erb'),
    mode => 644
  }
}
