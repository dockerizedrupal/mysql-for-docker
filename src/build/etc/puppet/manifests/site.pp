node default {
  include '::mysql::server'

  class { '::mysql::server':
    root_password    => 'root',
  }
}