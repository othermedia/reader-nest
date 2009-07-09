require File.dirname(__FILE__) + '/../../config/environment'

namespace :twitter do
  task :search do
    loop do
      Search.find(:all).each { |s| s.poll }
      sleep 60
    end
  end
end

