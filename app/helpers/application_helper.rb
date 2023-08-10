module ApplicationHelper
  def render_flash_messages
    if flash[:success]
      content_tag(:div, flash[:success], class: 'flash-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'flash-alert')
    end
  end
end
