class Sys::Lib::Form::Element::TextField < Sys::Lib::Form::Element::Base
  def make_tag
    @form.template.text_field_tag(tag_name, @value, @options)
  end
end