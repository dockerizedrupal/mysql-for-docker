class mysqld::general_log {
  file { '/etc/mysql/conf.d/general_log.cnf':
    ensure => present,
    content => template('mysqld/general_log.cnf.erb'),
    mode => 644
  }
}
