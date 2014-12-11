class AddAttachmentVideoToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :pages, :video
  end
end
