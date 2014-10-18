class mysql {
  require mysql::packages

  exec { 'mkdir -p /mysql-5.5.38/data':
    path => ['/bin']
  }

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => 'puppet:///modules/mysql/etc/mysql/my.cnf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/mysql.conf':
    ensure => present,
    source => 'puppet:///modules/mysql/etc/supervisor/conf.d/mysql.conf'
  }
}
