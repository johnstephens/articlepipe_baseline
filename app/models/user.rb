class User < ActiveRecord::Base
  after_create {|user| AccessLevel.create(user_id: user.id); Profile.create(user_id: user.id, display_name: user.email) }
  after_save {|user| user.access_level.save; user.profile.save }
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :access_level, dependent: :destroy
  has_one :profile, dependent: :destroy
  
  delegate :display_name, :to => :profile
  delegate :admin?, :to => :access_level
  

  def first_confirmation?
    previous_changes[:confirmed_at] && previous_changes[:confirmed_at].first.nil?
  end
  
  def confirm!
    super
    if first_confirmation?
      access_level.user_level = 100
    end
  end
  
  
        
end
