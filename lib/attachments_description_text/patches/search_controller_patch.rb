# lib/attachments_description_text/patches/search_controller_patch.rb
module AttachmentsDescriptionText
  module Patches
    module SearchControllerPatch
      def self.prepended(base)
        # Let Rails know we're modifying the SearchController
        base.send(:prepend, InstanceMethods)
      end

      module InstanceMethods
        # This will run before the original index method
        def index
          # Temporarily modify params[:attachments] if it's not present
          if params[:attachments].blank?
            params[:attachments] = '1'
          end

          # Call the original index method
          super
        end
      end
    end
  end
end

unless SearchController.ancestors.include?(AttachmentsDescriptionText::Patches::SearchControllerPatch)
  SearchController.prepend(AttachmentsDescriptionText::Patches::SearchControllerPatch)
end
