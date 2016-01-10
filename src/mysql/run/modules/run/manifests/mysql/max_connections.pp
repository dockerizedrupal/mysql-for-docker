class run::mysql::max_connections {
  file { '/etc/mysql/conf.d/max_connections.cnf':
    ensure => present,
    content => template('run/max_connections.cnf.erb'),
    mode => 644
  }
}
