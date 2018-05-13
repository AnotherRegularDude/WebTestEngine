class Topic < ApplicationRecord
  has_many :articles, dependent: :destroy
end
