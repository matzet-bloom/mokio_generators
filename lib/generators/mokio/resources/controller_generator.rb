# controller_generator.rb
require 'rails/generators'

module Mokio
  module Resources
    class ControllerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      argument :column_names, type: :array, default: [], banner: 'field:type field:type'

      def generate_controller
        template 'controller_template.rb', "app/controllers/mokio/#{plural_table_name}_controller.rb"
      end

      private

      def attributes_list
        column_names.map { |column| column.split(':').first }
      end

      def controller_class_name
        "#{plural_table_name.camelize}Controller"
      end
    end
  end
end
