#
# Cookbook Name:: gitlab
# Recipe:: default
#
# Copyright (c) 2016 Robert Ressl, All Rights Reserved.

gitlab_user 'testmich' do
  action :delete
  email 'testmich@safematix.com'
  password 'setup123'
end

gitlab_user 'test' do
  action :delete
  email 'test@safematix.com'
  password 'setup123'
end

gitlab_user 'test2' do
  action :delete
  email 'test2@safematix.com'
  password 'setup123'
end

gitlab_user 'testmich_neu' do
  action :delete
  email 'testmich_neu@safematix.com'
  password 'setup123'
end
