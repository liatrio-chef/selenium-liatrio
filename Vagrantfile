# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/centos-7.2'

  config.berkshelf.enabled = true
  config.vm.provision 'chef_solo' do |chef|
    chef.version = '12.16.42'

    chef.add_recipe 'selenium-liatrio::default'
    chef.json = {
      'java' => {
        'jdk_version' => '8',
        'install_flavor' => 'openjdk'
      },
      'selenium_liatrio' => {
        'user' => 'vagrant',
        'group' => 'vagrant',
        'home' => '/home/vagrant'
      }
    }
  end

  config.vm.network :private_network, ip: '192.168.100.100'
  config.vm.network 'forwarded_port', guest: 4444, host: 14444
  config.vm.network 'forwarded_port', guest: 5555, host: 15555
  config.vm.network 'forwarded_port', guest: 6000, host: 16000

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    v.customize ['modifyvm', :id, '--cableconnected1', 'on']
    v.customize ['modifyvm', :id, '--cableconnected2', 'on']
  end

  #  config.vm.provision "shell", inline: "firewall-cmd --permanent --add-port=4444/tcp && firewall-cmd --reload"
  config.vm.provision 'shell', inline: 'systemctl stop firewalld'
end
