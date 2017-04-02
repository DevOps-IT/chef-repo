# encoding: UTF-8
name             'cust_wildfly'
maintainer       'Brian Dwyer - Intelligent Digital Services'
maintainer_email 'bdwyertech'
license          'Apache License, Version 2.0'
description      'Installs/Configures wildfly'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.5'

supports 'centos'

depends 'apt'
depends 'yum'
