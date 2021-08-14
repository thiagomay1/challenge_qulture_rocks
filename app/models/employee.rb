class Employee < ApplicationRecord
  acts_as_nested_set :scope => :company_id

  belongs_to :company
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, :format => /@/

  def add_subordinate!(subordinate)
    validate_other_company!(subordinate)
    raise Exceptions::LoopLeadership if self.ancestors.exists?(id: subordinate.id)
    subordinate.move_to_child_of(self)
  end

  def leader!(leader)
    validate_other_company!(leader)
    raise Exceptions::LoopLeadership if self.descendants.exists?(id: leader.id)
    move_to_child_of(leader)
  end

  def subordinates
    children
  end

  def leader
    parent
  end

  private 
  def validate_other_company!(other_employee)
    raise Exceptions::OtherCompanyEmployee if company_id != other_employee.company_id
  end
end
