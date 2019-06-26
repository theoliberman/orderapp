class ChangeDateTypeInOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :new_date, :datetime
    Order.all.each do |order|
      order.update(new_date: DateTime.iso8601(order.date))
    end
    remove_column :orders, :date
    rename_column :orders, :new_date, :date
  end
end
