class run::mysql::max_allowed_packet {
  file { '/etc/mysql/conf.d/max_allowed_packet.cnf':
    ensure => present,
    content => template('run/max_allowed_packet.cnf.erb'),
    mode => 644
  }
}
