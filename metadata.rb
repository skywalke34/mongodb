name 'mongodb'
maintainer 'Tracy Walker'
maintainer_email 'TracyFWalker@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures mongodb'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'

recipe 'mongodb', 'Installs a single node mongodb instance'
recipe 'mongodb::install', 'Installs and configures a mongos'

%w(
  google
  amazon
  centos
  redhat
  ubuntu
).each do |os|
  supports os
end

chef_version '>= 12.14' if respond_to?(:chef_version)
issues_url 'https://github.com/skywalke34/mongodb/issues'
source_url 'https://github.com/skywalke34/mongodb'
