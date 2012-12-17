class ChangeListMailToMailListInAlert < ActiveRecord::Migration
  def up
    rename_column :alerts, :list_mail, :mail_list
  end

  def down
    rename_column :alerts, :mail_list, :list_mail
  end
end
