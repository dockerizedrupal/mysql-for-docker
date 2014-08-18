#!/usr/bin/env bash

puppet module install puppetlabs-mysql

puppet apply /opt/build/etc/puppet/manifests/build.pp

rm /opt/build/etc/puppet/manifests/build.pp

cp /opt/build/etc/puppet/manifests/run.pp /etc/puppet/manifests/run.pp