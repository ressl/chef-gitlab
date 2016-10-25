property :instance_name, String, name_property: true
property :name, RubyType, default: 'value'

load_current_value do
  # some Ruby
end

action :create do

end

action :name do
 # a mix of built-in Chef resources and Ruby
end
