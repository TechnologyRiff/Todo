class Task < ActiveRecord::Base
  belongs_to :user
    belongs_to :list

  default_scope { order('created_at DESC') }

    validates :body, length: { minimum: 5 }, presence: true
    validates :user_id, presence: true

    

end
