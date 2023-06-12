require 'rails/generators'

module Mokio
  module Resources
    class FormGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      argument :column_names, type: :array, default: [], banner: 'field:type field:type'

      def generate_form
        @column_names_list = column_names_list
        template 'form.html.erb', "app/views/mokio/#{plural_name}/_form.html.slim"
      end

      private

      def column_names_list
        column_names.map { |column| column.split(':').first }
      end

      def plural_name
        name.pluralize.underscore
      end
    end
  end
end