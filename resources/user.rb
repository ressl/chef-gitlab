resource_name :gitlab_user

property :instance_name, String, name_property: true
property :email, String, default: 'email@example.com'
property :password, String, default: 'setup123'
property :url, String, default: 'https://git.safematix.com/api/v3/users'
property :token, String, default: 'blablabla'

action :create do
  chef_gem 'rest-client'
  chef_gem 'json'

  require 'rest-client'
  require 'json'
  user = JSON.parse(RestClient.get(url, { :'PRIVATE-TOKEN' => token }))
  instance_user = user.find_all { |e| e['username'] == instance_name }

  if instance_user.empty?
    RestClient.post(url, { username: instance_name, password: password, email: email, name: instance_name }, { :'PRIVATE-TOKEN' => token })
  else
    true
  end
end

action :delete do
  chef_gem 'rest-client'
  chef_gem 'json'

  require 'rest-client'
  require 'json'
  user = JSON.parse(RestClient.get(url, { :'PRIVATE-TOKEN' => token }))

  instance_user = user.find_all { |e| e['username'] == instance_name }
  if instance_user.empty?
    true
  else
    instance_user_id = instance_user.first['id']
  end

  if instance_user.empty?
    true
  else
    RestClient.delete("#{url}/#{instance_user_id}", { :'PRIVATE-TOKEN' => token })
  end
end
