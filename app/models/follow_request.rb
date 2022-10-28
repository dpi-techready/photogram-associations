# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  
    # Associations:

    has_many(:sender, { :class_name => "User", :foreign_key => "sender_id", :dependent => :destroy })

    # has_many(:sender, { :class_name => "User", :foreign_key => "sender_id" })
  
    # def sender
    #   my_id = self.id
  
    #   matching_users = User.where({ :sender_id => my_id })
  
    #   return matching_users
    # end
  
    belongs_to(:recipient, { :class_name => "User" })
  
    #   belongs_to(:recipient, { :class_name => "User", :foreign_key => "recipient_id", :required => true })
  
    # belongs_to(:recipient, { :class_name => "User", :foreign_key => "recipient_id" })
  
    # def recipient
    #   my_recipient_id = self.recipient_id
  
    #   matching_users = User.where({ :id => my_recipient_id })
  
    #   the_user = matching_users.at(0)
  
    #   return the_user
    # end
    
end
