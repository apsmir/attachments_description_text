# frozen_string_literal: true
class AttachmentDescriptionHook < Redmine::Hook::ViewListener
  # Adds necessary CSS and JavaScript files for attachments description functionality
  # @param context [Hash] the context from the hook
  # @return [String] HTML string containing stylesheet and javascript includes
  def view_layouts_base_html_head(context = {})
    return '' unless context.is_a?(Hash)

    javascript = <<-JAVASCRIPT
      var ATTACHMENT_TEXTS = {
        show_all: "#{escape_javascript I18n.t('attachments_description_text.show_all')}",
        hide: "#{escape_javascript I18n.t('attachments_description_text.hide')}"
      };
    JAVASCRIPT

    [
      "\n<!-- [attachments_description_text plugin] -->\n",
      stylesheet_link_tag("attachments_description", plugin: "attachments_description_text"),
      javascript_include_tag("attachments_description", plugin: "attachments_description_text"),
      javascript_tag(javascript)
    ].join
  end
end