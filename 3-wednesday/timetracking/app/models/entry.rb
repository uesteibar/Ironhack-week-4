class Entry < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :project_id, :hours, :minutes
  validate :proper_minutes

  private

  def proper_minutes
    unless minutes.present? && minutes >= 0 && minutes <= 60
      errors.add(:minutes, 'minutes should be between 0 and 60')
    end
  end
end
