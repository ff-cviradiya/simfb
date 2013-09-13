class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :city, :state,
                  :country,:address,:security,:subscribe,:gender,:username
  # attr_accessible :title, :body
  
  has_many :user_relations, :dependent => :destroy
  has_many :statuses, :dependent => :destroy
  has_many :likes, :through => :statuses

  validates_length_of :username, :within=>4..8,:allow_blank=>true


  def self.fetch_all_users
    # QUALITY_BREACH - This one breaks the Practise where we should not rescue Exception
    test = nil
    begin
      test = User.all
    rescue Exception => e
      test = []
      logger.warn "Unable to foo, will ignore: #{e}"
    end
    test
  end

end
