node default {
  file { '/etc/puppet/manifests/run.pp':
    ensure => present,
    source => '/tmp/build/etc/puppet/manifests/run.pp',
  }

  class { 'mysql::server':
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