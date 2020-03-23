class RemoveCommentPostReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :post, index:true, foreign_key: true
  end
end
