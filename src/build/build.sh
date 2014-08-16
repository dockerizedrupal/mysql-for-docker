#!/bin/sh

apt-get install ca-certificates

puppet module install puppetlabs-mysql

cp /opt/build/etc/puppet/manifests/site.pp /etc/puppet/manifests/site.pp

puppet apply /etc/puppet/manifests/site.pp