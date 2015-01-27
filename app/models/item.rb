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

  def age_urgent
    age >= 0.85
  end  

  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
end
