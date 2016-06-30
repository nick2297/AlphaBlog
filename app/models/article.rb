class Article < ActiveRecord::Base

  validates :description, presence: true, length: {minimum: 3, maximum: 50}
  validates :title, presence: true

end