#!/bin/sh

cat /etc/puppet/manifests/site.pp

ls -l /etc/puppet/modules

puppet module install puppetlabs-mysql

cp /opt/build/etc/puppet/manifests/site.pp /etc/puppet/manifests/site.pp

puppet apply /etc/puppet/manifests/site.pp