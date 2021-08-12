class Employee < ApplicationRecord
  belongs_to :company
  validates :name, :email, presence: true
  validates :email, uniqueness: true
 validates :email, :format => /@/
end
