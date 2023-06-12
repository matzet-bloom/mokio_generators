# controller_generator.rb
require 'rails/generators'

module Mokio
  module Resources
    class LocaleGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      argument :model_name, type: :string, desc: 'Name of the model'
      argument :column_names, type: :array, default: [], banner: 'Column names'

      def generate_locale_file
        @parsed_column_names = column_names.map { |column| column.include?(':') ? column.split(':').first : column }
        @mname = model_name.underscore.pluralize.singularize
        # todo properly model name

        I18n.available_locales.each do |locale_name|
          @locale_name = locale_name
          template 'locale_template.yml.erb', "config/locales/#{controller_name}.#{locale_name}.yml"
        end
      end

      private

      def controller_name
        model_name.pluralize.underscore
      end
    end
  end
end
