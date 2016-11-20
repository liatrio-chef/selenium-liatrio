#
# Cookbook Name:: selenium-liatrio
# Recipe:: default
#
# Author: Drew Holt <drew@liatrio.com>
#

package 'ruby'
package 'ruby-devel'

gem_package 'selenium-webdriver'
gem_package 'rspec'

include_recipe 'selenium'
include_recipe 'selenium_grid::hub'
include_recipe 'selenium_grid::node'

include_recipe 'chrome'
include_recipe 'chromedriver'
package 'firefox'

node.set['selenium']['node']['capabilities'] = [
  {
    browserName: 'chrome',
    maxInstances: 1,
    version: chrome_version,
    seleniumProtocol: 'WebDriver'
  },
  {
    browserName: 'firefox',
    maxInstances: 1,
    version: 'latest',
    seleniumProtocol: 'WebDriver'
  }
]

include_recipe 'selenium::node'

template '/home/vagrant/chrome_test.rb' do
  source 'home/vagrant/chrome_test.rb'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

template '/home/vagrant/firefox_test.rb' do
  source 'home/vagrant/firefox_test.rb'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end
