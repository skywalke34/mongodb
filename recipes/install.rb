##########################################################################
# Cookbook Name:: mongodb
# Recipe:: install
#
# Author: Tracy Walker <TracyFWalker@gmail.com>
# Chef Interview Project
##########################################################################
#

# Create a /etc/yum.repos.d/mongodb.repo file to hold the following configuration information for the MongoDB repository:
#
# If you are running a 64-bit system, use the following configuration:
#
# [mongodb-org-3.6]
# name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.6/x86_64/
# gpgcheck=1
# enabled=1
# gpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc
#
# [mongodb]
# name=MongoDB Repository
# baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/i686/
# gpgcheck=0
# enabled=1
#
# file '/etc/yum.repos.d/mongodb.repo' do

# Use Template to create yum repo file for mongodb
cookbook_file '/etc/yum.repos.d/mongodb.repo' do
  source 'mongodb.repo'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


# Install the MongoDB packages and associated tools.
#
# sudo yum install mongodb-org
#
yum_package 'mongodb-org' do



#
# Start MongoDB.
#
# sudo service mongod start
# ensure that MongoDB will start following a system reboot by issuing the following command:
# sudo chkconfig mongod on#
# ======================================
# by using the supports restart (default values are set to false, so we will set to true
# and then start the service.

service 'mongod' do
   supports :status => true, :restart => true, :reload => true
   action :start
end

