class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_one :interview
end
