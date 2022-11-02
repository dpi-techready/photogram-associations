# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#
class Comment < ApplicationRecord
  
   # Associations:

   belongs_to(:commenter, { :class_name => "User", :foreign_key => "author_id" })

   belongs_to(:commenter, { :class_name => "User", :foreign_key => "author_id", :required => false })

   def commenter
    my_author_id = self.author_id

    matching_users = User.where({ :id => my_author_id })

    the_user = matching_users.at(0)

    return the_user
  end

   belongs_to(:photo)

   belongs_to(:photo, { :class_name => "Photo" })
 
   belongs_to(:photo, { :class_name => "Photo", :foreign_key => "photo_id" })

   belongs_to(:photo, { :class_name => "Photo", :foreign_key => "photo_id", :required => false })
 
   def photo
     my_photo_id = self.photo_id
 
     matching_photos = Photo.where({ :id => my_photo_id })
 
     the_photo = matching_photos.at(0)
 
     return the_photo
   end
 
   belongs_to(:author, { :class_name => "User" })
 
   belongs_to(:author, { :class_name => "User", :foreign_key => "author_id" })

   belongs_to(:author, { :class_name => "User", :foreign_key => "author_id", :required => true })
 
   def author
     my_author_id = self.author_id
 
     matching_users = User.where({ :id => my_author_id })
 
     the_user = matching_users.at(0)
 
     return the_user
   end

   has_one(:comments_count, { :through => :photo, :source => :poster })

   def comments_count
    my_photo = self.photo

    the_poster = my_photo.poster

    return the_poster
  end
end
