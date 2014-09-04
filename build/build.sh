#!/usr/bin/env bash

puppet module install puppetlabs-mysql

puppet apply /tmp/build/etc/puppet/manifests/build.pp
