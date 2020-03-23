class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :pic
  end
end
