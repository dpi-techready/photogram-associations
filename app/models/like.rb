# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#
class Like < ApplicationRecord

    # Associations:

    belongs_to(:photo)

    # belongs_to(:photo, { :class_name => "Photo" })
  
    # belongs_to(:photo, { :class_name => "Photo", :foreign_key => "photo_id", :required => true })
  
    # belongs_to(:photo, { :class_name => "Photo", :foreign_key => "photo_id" })
  
    # def photo
    #   my_photo_id = self.photo_id
  
    #   matching_photos = Photo.where({ :id => my_photo_id })
  
    #   the_photo = matching_photos.at(0)
  
    #   return the_photo
    # end
  
    belongs_to(:fan, { :class_name => "User" })
  
    # belongs_to(:fan, { :class_name => "User", :foreign_key => "fan_id", :required => true })
  
    # belongs_to(:fan, { :class_name => "User", :foreign_key => "fan_id" })
  
    # def fan
    #   my_fan_id = self.fan_id
  
    #   matching_users = User.where({ :id => my_fan_id })
  
    #   the_user = matching_users.at(0)
  
    #   return the_user
    # end

    has_one(:likes_count, { :through => :photo, :source => :poster })

  # def likes_count
  #   my_photo = self.photo

  #   the_poster = my_photo.poster

  #   return the_poster
  # end  
end
