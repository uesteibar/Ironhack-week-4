class Entry < ActiveRecord::Base
  belongs_to :project

  validate :proper_minutes
  validates_presence_of :project_id

  private

  def proper_minutes
    unless minutes >= 0 && minutes <= 60
      errors.add(:minutes, 'minutes should be between 0 and 60')
    end
  end
end
