#!/bin/sh

ls /etc/puppet/manifests -la

puppet module install puppetlabs-mysql

cp /opt/build/etc/puppet/manifests/mysql.pp /etc/puppet/manifests/mysql.pp

puppet apply /etc/puppet/manifests/mysql.pp