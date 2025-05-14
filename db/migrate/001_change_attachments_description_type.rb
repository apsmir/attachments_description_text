class ChangeAttachmentsDescriptionType < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def self.up
    change_column :attachments, :description, :text
  end

  def self.down
    change_column :attachments, :description, :string
  end
end# frozen_string_literal: true

