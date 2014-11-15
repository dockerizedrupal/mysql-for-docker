class mysqld {
  require mysqld::packages

  exec { 'mkdir -p /mysqld-5.5.38/data':
    path => ['/bin']
  }

  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/mysql/my.cnf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/mysqld.conf':
    ensure => present,
    source => 'puppet:///modules/mysqld/etc/supervisor/conf.d/mysqld.conf'
  }
}
