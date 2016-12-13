# filename: firefox_test.rb

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for(
    :remote,
    url: 'http://localhost:4444/wd/hub',
    desired_capabilities: :firefox) # or chrome or whatever
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
  @driver.get('http://192.168.100.10:8082/spring-petclinic/')
  expect(@driver.title).to eql 'PetClinic :: a Spring Framework demonstration'

  @driver.find_element(:link, 'Find owners').click
  expect(@driver.find_element(:link, 'Find owners').text).to eql 'Find owners'

  @driver.find_element(:tag_name, 'input').send_keys 'Estaban'
  expect(@driver.find_element(:tag_name, 'input')['value']).to eql 'Estaban'

  @driver.find_element(:css, 'button[type="submit"]').click
  # expect(@driver.find_element(:css, "button[type=\"submit\"]")['value']).to eql "submit"

  @driver.find_element(:link, 'Add Visit').click
  # expect(@driver.find_element(:link, "Add Visit").text).to eql "Add Visit"

  @driver.find_element(:id, 'description').clear
  expect(@driver.find_element(:id, 'description')['value']).to eql ''

  @driver.find_element(:id, 'description').send_keys 'check up added test'
  expect(@driver.find_element(:id, 'description')['value']).to eql 'check up added test'

  @driver.find_element(:css, 'button[type="submit"]').click
  # expect(@driver.find_element(:css, "button[type=\"submit\"]")['value']).to eql "submit"

  # expect check up added test on page
  expect(@driver.find_element(:xpath, '/html/body/div/table[2]/tbody/tr/td[2]/table/tbody/tr[1]/td[2]').text).to eql 'check up added test'

  @driver.save_screenshot('checkup_firefox.png')
end
