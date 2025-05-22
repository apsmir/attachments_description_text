Redmine::Plugin.register :attachments_description_text do
  name 'Redmine attachments description to text'
  author 'Alexey Smirnov'
  description 'This is a plugin for Redmine, change attachments description type from string to text'
  version '1.1'
  url 'https://github.com/apsmir/attachments_description_text'
  author_url 'https://github.com/apsmir'

end

require_dependency File.dirname(__FILE__) + '/lib/attachment_description_hook'
require_dependency File.dirname(__FILE__) + '/lib/attachments_description_text/patches/search_controller_patch'

Rails.application.config.after_initialize do
  if defined?(Attachment)
    Attachment.class_eval do
      validators = _validators[:description] || []
      validators.each do |validator|
        if validator.is_a?(ActiveModel::Validations::LengthValidator)
          validator.attributes.delete(:description)
        end
      end
      _validators.delete(:description)
    end
  end
end
