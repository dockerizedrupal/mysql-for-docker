node default {
  class { '::mysql::server':
    root_password => 'root',
    override_options => {
      'mysqld' => {
        'bind-address' => '0.0.0.0',
      }
    }
  }

  mysql_grant { 'root@%/*.*':
    ensure => 'present',
    options => ['GRANT'],
    privileges => ['ALL'],
    table => '*.*',
    user => 'root@%'
  }
}