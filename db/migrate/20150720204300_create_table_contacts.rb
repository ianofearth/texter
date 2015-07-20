class CreateTableContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.column :name, :string
      t.column :number, :string

    end
    add_column :messages, :contact_id, :integer

  end
end
