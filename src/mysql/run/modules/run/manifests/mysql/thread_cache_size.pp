class run::mysql::thread_cache_size {
  file { '/etc/mysql/conf.d/thread_cache_size.cnf':
    ensure => present,
    content => template('run/thread_cache_size.cnf.erb'),
    mode => 644
  }
}
