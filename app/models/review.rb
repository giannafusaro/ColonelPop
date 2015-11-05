class Review < ActiveRecord::Base

  validates :email, presence: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'is invalid'
  }

  validates :rating, inclusion: {
    in: (1..10).to_a,
    message: 'must be between 1 and 10'
  }

end
