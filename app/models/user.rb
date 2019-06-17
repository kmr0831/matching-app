class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  #scope :matching, -> user_id { joins("INNER JOIN relationships ON relationships.follower_id = users.id
  #INNER JOIN relationships AS r ON relationships.following_id = r.follower_id AND r.following_id = relationships.follower_id").where('relationships.following_id = ?', user_id) }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  
  has_many :from_messages, class_name: "Messege", foreign_key: "from_id", dependent: :destroy
  has_many :to_messages, class_name: "Messege", foreign_key: "to_id", dependent: :destroy
  has_many :sent_messages, through: :from_messages, source: :from
  has_many :received_messages, through: :sent_messages, source: :to
  
  def send_massage(other_user, room_id, content)
    from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
  end
  
  # def matchers
  #   follower_ids = passive_relationships.pluck(:follower_id)
  #   active_relationships.eager_load(:following).select{|r|follower_ids.include? r.following_id}.map{|r|r.following}
  # end
  
  # before_save { self.email = email.downcase! }
  
  def follow(other_user)
    following << other_user
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
  
  def matchers
    following & followers
  end
  
  
end
