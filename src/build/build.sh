#!/bin/sh

dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

puppet module install puppetlabs-mysql

cp /opt/build/etc/puppet/manifests/site.pp /etc/puppet/manifests/site.pp

puppet apply /etc/puppet/manifests/site.pp