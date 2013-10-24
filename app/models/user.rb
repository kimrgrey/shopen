class User < ActiveRecord::Base  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable, 
         :lockable, :timeoutable

  def full_name
    first_name.present? && last_name.present? ? "#{first_name} #{last_name}" : self.email
  end
end
