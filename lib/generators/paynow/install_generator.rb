module Paynow
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Create Paynow configuration file"

      def copy_config
        template 'config/initializers/paynow.rb'
      end

      def testing
        puts "Wowza, it is working"
      end

    end
  end
end