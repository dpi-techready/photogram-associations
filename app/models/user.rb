# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:photo_owner, { :class_name => "Photo", :foreign_key => "owner_id", :dependent => :destroy })

  # has_many(:photo_owner, { :class_name => "Photo", :foreign_key => "owner_id" })

  # def photo_owner
  #   my_id = self.id

  #   matching_photos = Photo.where({ :owner_id => my_id })

  #   return matching_photos
  # end

  has_many(:user_comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })

  # has_many(:user_comments, { :class_name => "Comment", :foreign_key => "author_id" })

  # def user_comments
  #   my_id = self.id

  #   matching_comments = Comment.where({ :author_id => my_id })

  #   return matching_comments
  # end

  has_many(:user_likes, { :class_name => "Like", :foreign_key => "fan_id", :dependent => :destroy })

  # has_many(:user_likes, { :class_name => "Like", :foreign_key => "fan_id" })

  # def user_likes
  #   my_id = self.id

  #   matching_likes = Like.where({ :fan_id => my_id })

  #   return matching_likes
  # end

  has_many(:follow_requests_sent, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })

  # has_many(:follow_requests_sent, { :class_name => "FollowRequest", :foreign_key => "sender_id" })

  # def follow_requests_sent
  #   my_id = self.id

  #   matching_follow_requests = FollowRequest.where({ :sender_id => my_id })

  #   return matching_follow_requests
  # end

  has_many(:follow_requests_received, { :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy })

  # has_many(:follow_requests_received, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  # def follow_requests_received
  #   my_id = self.id

  #   matching_follow_requests = FollowRequest.where({ :recipient_id => my_id })

  #   return matching_follow_requests
  # end
end
