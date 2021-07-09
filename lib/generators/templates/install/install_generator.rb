require 'rails/generators'

module Paynow
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc "Create Paynow configuration file"

      def copy_config
        copy_file 'paynow.rb', 'config/initializers/paynow.rb'
      end
    end
  end
end