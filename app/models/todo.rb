class Todo < ActiveRecord::Base
  validates :description, length: {minimum: 5 }, presence: true
  belongs_to :user

  default_scope { order('complete ASC') }
  default_scope { order('days_left DESC') }
  #This I guess lets me call these as methods later? Although I'm not sure where I'd call them...sticking to default for now
  #scope :ordered_by_complete, -> { order ('complete ASC') }
  #scope :ordered_by_days_left, -> { order ('days_left DESC') }

  def toggle_complete
    if self.complete?
      self.complete = false
    else
      self.complete = true
    end

    self.save
  end
end
