class Vote < ApplicationRecord
  belongs_to :link, validate: true
  belongs_to :user, validate: true

  validates_uniqueness_of :link_id, scope: :user_id, :message => "You can't vote more than once"
end
