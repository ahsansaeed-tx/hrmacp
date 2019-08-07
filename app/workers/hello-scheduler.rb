# hello-scheduler.rb
require 'sidekiq'
require 'sidekiq-scheduler'

class HelloWorld
  include Sidekiq::Worker

  def perform
    puts 'Hello world'
  end
end
