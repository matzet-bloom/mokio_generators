# controller_generator.rb
require 'rails/generators'

module Mokio
  module Resources
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)
      argument :column_names, type: :array, default: [], banner: 'field:type field:type'

      def generate_model
        @filtered_columns = filtered_columns
        template 'model_template.erb', File.join('app/models/mokio/', "#{file_name}.rb")
      end

      private

      def only_columns
        column_names.map do |column_name|
          name, _ = column_name.split(':')
          name
        end
      end


      def filtered_columns
        @columns_list = only_columns
        not_add_columns = ['main_pic']
        filtered_columns =  @columns_list.reject { |column| not_add_columns.include?(column) }
        return filtered_columns
      end

      def columns
        column_names.map do |column_name|
          name, type = column_name.split(':')
          { name: name, type: type }
        end
      end
    end
  end
end
