#!/bin/sh

puppet module install puppetlabs-mysql

cp /opt/build/etc/puppet/manifests/site.pp /etc/puppet/manifests/site.pp

puppet apply /etc/puppet/manifests/site.pp