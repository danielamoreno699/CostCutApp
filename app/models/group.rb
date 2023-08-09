class Group < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    has_many :group_operations
    has_many :operations, through: :group_operations
    validates :name, presence: true, uniqueness: { scope: :author_id, message: 'You already have a group with this name', case_sensitive: false }

def sum_amount
    operations.sum(:amount)
end

def recent_operations
    operations.order(created_at: :desc)
end

end
