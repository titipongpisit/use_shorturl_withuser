class Url < ActiveRecord::Base
  belongs_to :user

  def self.random 
    shortened = ""
    6.times do
    shortened << (('A'..'Z').to_a + ('0'..'9').to_a).sample
    end  
    shortened
  end 
  

end
