class AttachmentDescriptionHook < Redmine::Hook::ViewListener

  def view_layouts_base_html_head(context={})
    html = "\n<!-- [attachments_description_text plugin] -->\n"
    html << stylesheet_link_tag("attachments_description", plugin: "attachments_description_text")
    html << javascript_include_tag("attachments_description", plugin: "attachments_description_text")
    return html
  end
end# frozen_string_literal: true

