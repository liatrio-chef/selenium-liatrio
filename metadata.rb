name             'selenium-liatrio'
maintainer       'Liatrio'
maintainer_email 'justin@liatrio.com'
license          'All rights reserved'
description      'Installs/Configures selenium-liatrio'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.3'

issues_url 'https://github.com/liatrio-chef/selenium-liatrio/issues' if respond_to?(:issues_url)
source_url 'https://github.com/liatrio-chef/selenium-liatrio' if respond_to?(:source_url)

depends 'java'
depends 'selenium', '~> 3.7.4'
depends 'selenium_grid'
depends 'chrome'
depends 'chromedriver'
