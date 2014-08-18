#!/usr/bin/env bash

puppet apply /opt/build/etc/puppet/manifests/run.pp

mysqld_safe