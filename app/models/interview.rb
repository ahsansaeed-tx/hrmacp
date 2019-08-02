class Interview < ApplicationRecord
  belongs_to :application
  enum status: [:rejected, :accepted, :pending]
  after_initialize :set_default_status, :if => :new_record?
  def set_default_status
    self.status ||= :pending
    # self.interview_confirmation ||= :false
  end
end
