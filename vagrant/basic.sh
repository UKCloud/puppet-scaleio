#!/bin/bash
# Installing OS dependencies
puppet apply -e 'package { 'git': ensure => 'installed' }'

# Install module dependency
puppet module install puppetlabs/stdlib

# Creating "device" for ScaleIO
truncate -s 500GB /var/scaleio.device

# Install ScaleIO module
cd /etc/puppetlabs/code/environments/production/modules/
git clone https://github.com/UKCloud/puppet-scaleio.git scaleio
cd scaleio
git checkout makegeneric
