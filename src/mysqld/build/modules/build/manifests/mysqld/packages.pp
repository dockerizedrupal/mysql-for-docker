class build::mysqld::packages {
  package {[
      'mysql-server'
    ]:
    ensure => present
  }
}
