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

    belongs_to(:sender, { :class_name => "User", :foreign_key => "sender_id" })

    belongs_to(:sender, { :class_name => "User", :foreign_key => "sender_id", :required => false })
  
    def sender
      my_sender_id = self.sender_id
  
      matching_users = User.where({ :id => my_sender_id })
  
      the_user = matching_users.at(0)
  
      return the_user
    end

    has_many(:sender, { :class_name => "User", :foreign_key => "sender_id" })

    has_many(:sender, { :class_name => "User", :foreign_key => "sender_id", :dependent => :destroy })

    def sender
      my_id = self.id
  
      matching_users = User.where({ :sender_id => my_id })
  
      return matching_users
    end
  
    belongs_to(:recipient, { :class_name => "User" })
  
    belongs_to(:recipient, { :class_name => "User", :foreign_key => "recipient_id" })

    belongs_to(:recipient, { :class_name => "User", :foreign_key => "recipient_id", :required => false })
  
    def recipient
      my_recipient_id = self.recipient_id
  
      matching_users = User.where({ :id => my_recipient_id })
  
      the_user = matching_users.at(0)
  
      return the_user
    end 
end
