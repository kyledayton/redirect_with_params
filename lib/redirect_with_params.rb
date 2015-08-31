require 'redirect_with_params/version'

if defined?(Rails)
  require 'redirect_with_params/railtie'
else
  STDERR.puts "redirect_with_params requires Rails, but Rails was not found"
end
