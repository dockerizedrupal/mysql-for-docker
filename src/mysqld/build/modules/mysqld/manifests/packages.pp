class mysqld::packages {
  package {[
      'mysql-server'
    ]:
    ensure => present
  }
}
