class AddCommentableToComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :post
    add_reference :comments, :commentable, polymorphic: true, null: false
  end
end
