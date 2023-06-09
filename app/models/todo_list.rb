class TodoList < ApplicationRecord
  has_many :todo_contents, dependent: :destroy

  validates :title, presence: true, length:{maximum:30}
end
