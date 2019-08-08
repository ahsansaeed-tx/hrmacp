# hello_world.rb
require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'
class HelloWorld
  include Sidekiq::Worker

  def perform
    employees = User.where(role: 'employee')

    employees.each do |employer|
      if employer.salary_status == false
        Salary.create(:user_id => employer.id, :month => Date.today, :salary => employer.salary )
      else
        User.update(employer.id, :salary_status => false)
      end
    end
  end
end
