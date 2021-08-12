class Company < ApplicationRecord
  include ActiveModel::Serialization

  has_many :employees
  validates :name, presence: true, uniqueness: true

  def attributes
    { :id => id, :name => name }
  end
end
