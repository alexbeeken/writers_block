class ChangeSentenceTablename < ActiveRecord::Migration[5.0]
  def up
    rename_table :sentences, :uploads
  end

  def down
    rename_table :uploads, :sentences
  end
end
