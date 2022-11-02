# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  
    # Associations:

    belongs_to(:likes, { :class_name => "Like", :foreign_key => "photo_id" })

    belongs_to(:likes, { :class_name => "Like", :foreign_key => "photo_id", :required => true })
  
    def likes
      my_photo_id = self.photo_id
  
      matching_likes = Like.where({ :id => my_photo_id })
  
      the_like = matching_likes.at(0)
  
      return the_like
    end

    has_many(:comments, { :class_name => "Comment", :foreign_key => "photo_id" })

    has_many(:comments, { :class_name => "Comment", :foreign_key => "photo_id", :dependent => :destroy })

    def comments
      my_id = self.id
  
      matching_comments = Comment.where({ :photo_id => my_id })
  
      return matching_comments
    end

    belongs_to(:poster, { :class_name => "User", :foreign_key => "owner_id" })

    belongs_to(:poster, { :class_name => "User", :foreign_key => "owner_id", :required => false })

    def poster
      my_owner_id = self.owner_id
  
      matching_users = User.where({ :id => my_owner_id })
  
      the_user = matching_users.at(0)
  
      return the_user
    end

    # Uploader line / Leave last

    mount_uploader :image, ImageUploader
end
