class Todo < ActiveRecord::Base
  validates :description, length: {minimum: 5 }, presence: true
  belongs_to :user
  after_initialize :init

  default_scope { order('complete ASC') }
  default_scope { order('days_left DESC') }
  #This I guess lets me call these as methods later? Although I'm not sure where I'd call them...sticking to default for now
  #scope :ordered_by_complete, -> { order ('complete ASC') }
  #scope :ordered_by_days_left, -> { order ('days_left DESC') }
  def init
    self.days_left  ||= 7
  end

  def toggle_complete
    self.complete? ? self.complete = false : self.complete = true
    self.save
  end
end
