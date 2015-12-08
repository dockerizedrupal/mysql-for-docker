class run::mysql::innodb_buffer_pool_size {
  file { '/etc/mysql/conf.d/innodb_buffer_pool_size.cnf':
    ensure => present,
    content => template('run/innodb_buffer_pool_size.cnf.erb'),
    mode => 644
  }
}
