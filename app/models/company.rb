class Company < ApplicationRecord
  include ActiveModel::Serialization

  validates :name, presence: true, uniqueness: true

  def attributes
    { :id => id, :name => name }
  end
end
