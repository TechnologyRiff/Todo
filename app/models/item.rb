class Item < ActiveRecord::Base
  belongs_to :list

  def age_to_delete
      if age_in_days >= 1
        update_attribute(:completed, true)
      end
  end

  def age_in_days
  created_at / (7.0 * 60 * 60 * 24)
  end
  
end
