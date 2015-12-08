class build::mysql::logs {
  require build::mysql::packages

  file { '/var/log/mysql/stdout.log':
    ensure => link,
    target => '/dev/stdout',
    force => true
  }

  file { '/var/log/mysql/stderr.log':
    ensure => link,
    target => '/dev/stderr',
    force => true
  }
}
