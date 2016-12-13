# filename: chrome_test.rb

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for(
    :remote,
    url: 'http://localhost:14444/wd/hub',
    desired_capabilities: :chrome
  ) # you can also use :firefox, :safari, etc.
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://www.google.com'
  @driver.save_screenshot('screenshot.png')
  expect(@driver.title).to eq('Google')
end
