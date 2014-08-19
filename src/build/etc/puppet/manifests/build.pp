node default {
  file { '/opt/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  file { '/etc/puppet/manifests/run.pp':
    ensure => present,
    source => '/tmp/build/etc/puppet/manifests/run.pp'
  }

  file { '/etc/supervisor/conf.d/mysql.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/mysql.conf'
  }

  class { 'mysql::server':
    root_password => 'root',
    override_options => {
      'mysqld' => {
        'bind-address' => '0.0.0.0'
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