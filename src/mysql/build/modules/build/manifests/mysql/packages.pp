class build::mysql::packages {
  package {[
      'mysql-server'
    ]:
    ensure => present
  }
}
