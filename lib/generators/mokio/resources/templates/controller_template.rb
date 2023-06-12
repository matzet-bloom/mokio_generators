# templates/controller_template.rb
class Mokio::<%= controller_class_name %> < Mokio::CommonController
  def <%= singular_table_name %>_params
    params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_list.map { |attr| ":#{attr}" }.join(', ') %>)
  end
end
