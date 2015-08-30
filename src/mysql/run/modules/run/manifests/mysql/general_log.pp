class run::mysql::general_log {
  file { '/etc/mysql/conf.d/general_log.cnf':
    ensure => present,
    content => template('run/general_log.cnf.erb'),
    mode => 644
  }
}
