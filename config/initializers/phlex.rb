require "phlex/rails"

%i[money_field].each do |method_name|
  Phlex::Rails::Helpers::FormWith::BufferedFormWith.alias_method method_name, :__output_method__
end
