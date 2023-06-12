
# controller_generator.rb
require 'rails/generators'

module Mokio
  module Resources
    class AddRoutesGenerator < Rails::Generators::Base
      argument :resource_name, type: :string, required: true, banner: 'resource_name'

      def add_resource_to_routes
        inject_into_file "config/routes.rb", after: "Mokio::Engine.routes.draw do\n" do
          "  resources :#{plural_resource_name.underscore}\n"
        end
      end

      private

      def plural_resource_name
        resource_name.pluralize
      end
    end

  end
end
