
# controller_generator.rb
require 'rails/generators'

module Mokio
  module Resources
    class AddGenerator < Rails::Generators::Base
      argument :resource_name, type: :string, required: true, banner: 'resource_name'
      argument :column_names, type: :array, default: [], banner: 'field:type field:type'

      def invoke_other_generators
        invoke("mokio:resources:model", [resource_name, *column_names])
        invoke("mokio:resources:controller", [resource_name.pluralize, *column_names])
        invoke("mokio:resources:form", [resource_name.pluralize, *column_names])
        invoke("mokio:resources:add_routes", [resource_name.pluralize])
        invoke("migration", ["CreateMokio#{resource_name.pluralize}", *column_names], skip: true)
        invoke("mokio:resources:locale", [resource_name.pluralize, *column_names])


        # invoke("resources:translations", [resource_name])
      end
    end
  end
end
