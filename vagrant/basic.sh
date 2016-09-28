#!/bin/bash

# Installing prerequisites
cd /vagrant/puppet
puppet apply preinstall.pp

# Install module dependency
puppet module install puppetlabs/stdlib

# Creating "device" for ScaleIO
truncate -s 500GB /var/scaleio.device

# Install ScaleIO module
cd /etc/puppetlabs/code/environments/production/modules/
git clone https://github.com/UKCloud/puppet-scaleio.git scaleio
cd scaleio
git checkout makegeneric

# Installing ScaleIO
cd /vagrant/puppet
puppet apply install.pp --hiera_config=hiera.config.yaml
