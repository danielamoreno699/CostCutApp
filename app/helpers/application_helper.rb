module ApplicationHelper
    def render_flash_messages
        if flash[:success]
          content_tag(:div, flash[:success], class: 'flash-success fade-out')
        elsif flash[:alert]
          content_tag(:div, flash[:alert], class: 'flash-alert fade-out')
        end
      end
end
