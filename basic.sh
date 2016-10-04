#!/bin/bash

# Install module dependency
puppet module install puppetlabs/stdlib
puppet module install puppetlabs/apt

# Installing prerequisites
cd /vagrant/puppet
puppet apply preinstall.pp

# Creating "device" for ScaleIO
truncate -s 500GB /var/scaleio.device

# Install ScaleIO module
#cd /etc/puppetlabs/code/environments/production/modules/
#git clone https://github.com/UKCloud/puppet-scaleio.git scaleio
#cd scaleio
#git checkout makegeneric
ln -s /vagrant /etc/puppetlabs/code/environments/production/modules/scaleio

# Installing ScaleIO
cd /vagrant/puppet
puppet apply install.pp --hiera_config=hiera.config.yaml
