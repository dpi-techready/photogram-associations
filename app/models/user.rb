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

  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy })

  def received_follow_requests
    my_id = self.id

    matching_follow_requests = FollowRequest.where({ :recipient_id => my_id })

    return matching_follow_requests
  end

  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id" })
  
  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })

  def sent_follow_requests
    my_id = self.id

    matching_follow_requests = FollowRequest.where({ :sender_id => my_id })

    return matching_follow_requests
  end

  has_many(:commented_photos, { :through => :photo_owner, :source => :comments })

  def commented_photos
    array_of_comment_ids = Array.new

    my_photo_owner = self.photo_owner

    my_photo_owner.each do |a_photo|
      the_photo_owner_comments = a_photo.comments

      the_photo_owner_comments.each do |a_comment|
        array_of_comment_ids.push(a_comment.id)
      end
    end

    matching_comments = Comment.where({ :id => array_of_comment_ids })

    return matching_comments
  end

  has_many(:liked_photos, { :through => :user_likes, :source => :photo })

  def liked_photos
    array_of_photo_ids = Array.new

    my_user_likes = self.user_likes

    my_user_likes.each do |a_like|
      the_photo = a_like.photo

      array_of_photo_ids.push(the_photo.id)
  end

  matching_photos = Photo.where({ :id => array_of_photo_ids })

  return matching_photos
end

  has_many(:photo_owner, { :class_name => "Photo", :foreign_key => "owner_id" })

  has_many(:photo_owner, { :class_name => "Photo", :foreign_key => "owner_id", :dependent => :destroy })

  def photo_owner
    my_id = self.id

    matching_photos = Photo.where({ :owner_id => my_id })

    return matching_photos
  end

  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id" })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })

  def comments
    my_id = self.id

    matching_comments = Comment.where({ :author_id => my_id })

    return matching_comments
  end

  has_many(:user_likes, { :class_name => "Like", :foreign_key => "fan_id" })

  has_many(:user_likes, { :class_name => "Like", :foreign_key => "fan_id", :dependent => :destroy })

  def user_likes
    my_id = self.id

    matching_likes = Like.where({ :fan_id => my_id })

    return matching_likes
  end

  has_many(:follow_requests_sent, { :class_name => "FollowRequest", :foreign_key => "sender_id" })

  has_many(:follow_requests_sent, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })

  def follow_requests_sent
    my_id = self.id

    matching_follow_requests = FollowRequest.where({ :sender_id => my_id })

    return matching_follow_requests
  end

  has_many(:follow_requests_received, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  has_many(:follow_requests_received, { :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy })

  def follow_requests_received
    my_id = self.id

    matching_follow_requests = FollowRequest.where({ :recipient_id => my_id })

    return matching_follow_requests
  end
end
