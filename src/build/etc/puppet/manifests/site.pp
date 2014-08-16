node default {
  class { '::mysql::server':
    root_password => 'root',
    override_options => {
      'mysqld' => {
        'max_connections' => '1024',
        'bind-address' => '0.0.0.0',
      },
    },
  }
}