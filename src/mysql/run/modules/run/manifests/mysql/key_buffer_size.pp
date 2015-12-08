class run::mysql::key_buffer_size {
  file { '/etc/mysql/conf.d/key_buffer_size.cnf':
    ensure => present,
    content => template('run/key_buffer_size.cnf.erb'),
    mode => 644
  }
}
