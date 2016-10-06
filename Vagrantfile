# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

unless Vagrant.has_plugin?('vagrant-hosts')
  puts "vagrant-hosts plugin is missing. Installing..."
  system("vagrant plugin install vagrant-hosts")
  puts("Vagrant is stupid lets try again...")
  exit
end

Vagrant.configure(2) do |config|

  servers = YAML.load_file('servers.yaml')
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.ssh.insert_key = false
      srv.vm.network "private_network", ip: servers["private_ip"]
      srv.vm.provision :hosts do |provisioner|
        provisioner.autoconfigure = true
        provisioner.sync_hosts    = true
      end

      if servers["provision_script"] != ''
        srv.vm.provision :shell, path: servers["provision_script"]
      end

      srv.vm.provider "vmware_fusion" do |vf|
        vf.gui = true
        vf.linked_clone = false
        vf.memory = servers["ram"]
        vf.cpus = servers["cpu_count"]
      end
      srv.vm.provider "vmware_workstation" do |vw|
        vw.linked_clone = false
        vw.memory = servers["ram"]
        vw.cpus = servers["cpu_count"]
      end
      srv.vm.provider "virtualbox" do |vb|
        vb.memory = servers["ram"]
        vb.cpus = servers["cpu_count"]
        vb.gui = true
      end

    end
  end

end
