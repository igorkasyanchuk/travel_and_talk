class User < ActiveRecord::Base
  attr_accessor :require_password
  
  # setup authlogic and use bcrypt to store passwords
  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :admin

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :password, :if => :require_password?
  validates_presence_of :password_confirmation, :if => :require_password?
  
  has_many :companies, :dependent => :destroy
  
  scope :admins, where(:admin => true)
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def require_password?
    new_record? || require_password
  end
  
  def is_admin?
    admin
  end
  
  def toggle_admin!
    self.admin = !is_admin?
    self.save
  end

end
