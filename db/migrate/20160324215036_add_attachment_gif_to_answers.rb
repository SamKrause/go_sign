class AddAttachmentGifToAnswers < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.attachment :gif
    end
  end

  def self.down
    remove_attachment :answers, :gif
  end
end
