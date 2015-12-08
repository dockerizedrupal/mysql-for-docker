class run::mysql::query_cache_type {
  file { '/etc/mysql/conf.d/query_cache_type.cnf':
    ensure => present,
    content => template('run/query_cache_type.cnf.erb'),
    mode => 644
  }
}
