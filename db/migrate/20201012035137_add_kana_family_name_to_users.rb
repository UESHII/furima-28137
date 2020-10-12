class AddKanaFamilyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :kana_family_name, :string, null:false
  end
end
