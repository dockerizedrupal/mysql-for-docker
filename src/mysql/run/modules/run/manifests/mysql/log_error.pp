class run::mysql::log_error {
  file { '/etc/mysql/conf.d/log_error.cnf':
    ensure => present,
    content => template('run/log_error.cnf.erb'),
    mode => 644
  }
}
