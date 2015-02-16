class Item < ActiveRecord::Base
  belongs_to :list

  default_scope { order('created_at DESC') }

  def age_to_delete
    if age >= 1
      update_attribute(:completed, true)
    end
  end

  def age
    created_at.to_i / (7.0 * 60 * 60 * 24)
  end

  def self.urgent
    urgent_at = (Time.now - 5.days)
    Item.where("created_at <= ?", urgent_at )
  end  

  def days_left
    (created_at.to_date + 7.days - Date.today).to_i
  end
  
end

