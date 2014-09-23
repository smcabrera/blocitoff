class Todo < ActiveRecord::Base
  validates :description, length: {minimum: 5 }, presence: true
  belongs_to :user

  def toggle_complete
    if self.complete?
      self.complete = false
    else
      self.complete = true
    end

    self.save
  end
end
