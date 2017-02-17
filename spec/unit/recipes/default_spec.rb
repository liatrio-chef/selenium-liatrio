# Cookbook Name: jenkins-liatrio
# Spec::default
require 'spec_helper'

describe 'selenium-liatrio::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  # Test packages
  packages = %w(
    ruby
    ruby-devel
    gcc
    firefox
    google-chrome
  )
  packages.each do |pkg|
    it "installs package #{pkg}" do
      expect(chef_run).to install_package(pkg)
    end
  end

  # Test Gems
  gems = %w(
    selenium-webdriver
    rspec
  )
  gems.each do |gm|
    it "installs gem #{gm}" do
      expect(chef_run).to install_gem_package(gm)
    end
  end

  # Test Included Recipes
  recipes = %w(
    java
    selenium
    selenium_grid::hub
    selenium_grid::node
    chrome
    chromedriver
    selenium::node
  )
  recipes.each do |recs|
    it "installs recipe #{recs}" do
      expect(chef_run).to include_recipe(recs)
    end
  end

  it 'creates chrome_test.rb' do
    expect(chef_run).to create_template('/home/vagrant/chrome_test.rb').with(
      source: 'chrome_test.rb',
      owner: 'vagrant',
      group: 'vagrant',
      mode: '0644'
    )
  end

  it 'creates firefox_test.rb' do
    expect(chef_run).to create_template('/home/vagrant/firefox_test.rb').with(
      source: 'firefox_test.rb',
      owner: 'vagrant',
      group: 'vagrant',
      mode: '0644'
    )
  end
end
