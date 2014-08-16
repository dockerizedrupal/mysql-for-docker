node default {
  class { '::mysql::server':
    root_password => 'root',
    override_options => {
      'mysqld' => {
        'max_connections' => '1024',
        'bind-address' => '0.0.0.0',
      },
      'mysqld_safe' => {
        'bind-address' => '0.0.0.0'
      }
    }
  }

  mysql_grant { 'root@%/*.*':
    ensure => 'present',
    options => ['GRANT'],
    privileges => ['ALL'],
    user => 'root@%/*.*',
  }
}