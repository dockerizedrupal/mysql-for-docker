node default {
  class { '::mysql::server':
    root_password    => 'root',
  }
}