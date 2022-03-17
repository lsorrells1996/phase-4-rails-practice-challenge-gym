class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client
  validate :custom_method

  def custom_method
    m = Membership.all.where(:client_id = new_client_id)
  
  end
end
