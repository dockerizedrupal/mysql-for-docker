#!/usr/bin/env bash

puppet module install puppetlabs-mysql

puppet apply /tmp/build/etc/puppet/manifests/build.pp

cp /tmp/build/etc/puppet/manifests/run.pp /etc/puppet/manifests/run.pp