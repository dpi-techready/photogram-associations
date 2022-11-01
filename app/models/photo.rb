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

    belongs_to(:poster, { :class_name => "User", :foreign_key => "owner_id", :required => true })

    # belongs_to(:poster, { :class_name => "User", :foreign_key => "owner_id" })
  
    # def poster
    #   my_owner_id = self.owner_id
  
    #   matching_users = User.where({ :id => my_owner_id })
  
    #   the_user = matching_users.at(0)
  
    #   return the_user
    # end

    # Uploader line / Leave last

    mount_uploader :image, ImageUploader
end
