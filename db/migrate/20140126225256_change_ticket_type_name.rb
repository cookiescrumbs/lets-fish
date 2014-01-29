class ChangeTicketTypeName < ActiveRecord::Migration
  def change
    rename_column :tickets, :type, :ticket_type
  end
end
