#
# Cookbook Name:: gitlab
# Recipe:: default
#
# Copyright (c) 2016 Robert Ressl, All Rights Reserved.

include_recipe 'build-essential::default'

chef_gem 'rest-client'
chef_gem 'json'

require 'rest-client'
require 'json'

test = RestClient.get 'https://git.safematix.com/api/v3/projects', {:'PRIVATE-TOKEN' => 'RyPjAFMV3hJs9wZdBbbe'}

template '/tmp/test_rest' do
  source 'test.erb'
  owner 'root'
  group 'root'
  mode '0600'
  variables(
    rest: test
  )
end
