class CustomFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  attr_accessor :output_buffer

  def text_field(attribute, options={})
    content_tag :div do
      label(attribute) + super + error_div(attribute)
    end
  end

  def text_area(attribute, options={})
    content_tag :div do
      label(attribute) + super + error_div(attribute)
    end
  end

  private
  def error_div(attribute)
    if object.errors[attribute].any?
      content_tag :div, class: "error-detail" do
        object.errors[attribute].first
      end
    else
      ""
    end
  end
end