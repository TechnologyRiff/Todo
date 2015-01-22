class Item < ActiveRecord::Base
  belongs_to :list

  default_scope { order('created_at DESC') }

  def age_to_delete
      if age >= 1
        update_attribute(:completed, true)
      end
  end

  def age
    created_at / (7.0 * 60 * 60 * 24)
  end
  
end
