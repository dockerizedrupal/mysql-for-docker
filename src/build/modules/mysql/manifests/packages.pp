class mysql::packages {
  exec { 'apt-get update':
    path => ['/usr/bin']
  }

  package {[
      'mysql-server'
    ]:
    ensure => present,
    require => Exec['apt-get update']
  }
}
