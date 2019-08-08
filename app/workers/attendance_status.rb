# hello_world.rb
require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'
class AttendanceStatus
  include Sidekiq::Worker

  def perform
    employees = User.where(role: 'employee')

    employees.each do |employer|
      if employer.attendance_value == false
        Attendance.create(:user_id => employer.id, :date => Date.today, :value => employer.attendance_value )
      else
        User.update(employer.id, :attendance_value => false)
      end
    end
  end
end