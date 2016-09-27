#!/bin/bash

#cd /vagrant/
#cp hiera/*  /root/
#cp puppet/* /root/
#rm -rf /etc/puppetlabs/code/environments/production/modules/scaleio
#cd /etc/puppetlabs/code/environments/production/modules
#tar xzf /vagrant/puppet-scaleio.tgz
#mv puppet-scaleio scaleio

# CentOS
#cp /vagrant/rpms/scaleio.repo /etc/yum.repos.d/

# Ubuntu
#if [ ! -L '/root/debs' ]; then
#  ln -s /vagrant/debs /root/debs
#fi
#cp /vagrant/debs/emc.list /etc/apt/sources.list.d/
#cp /vagrant/debs/nogpg /etc/apt/apt.conf.d/
## Because it is broken, remove it
#rm /etc/apt/sources.list.d/puppetlabs-pc1.list
#apt-get update
#apt-get install linux-image-4.2.0-27-generic
#cd /usr
