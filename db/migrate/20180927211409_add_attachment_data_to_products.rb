class AddAttachmentDataToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :attachment_data, :text
  end
end
