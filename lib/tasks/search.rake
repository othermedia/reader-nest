require File.dirname(__FILE__) + '/../../config/environment'

namespace :twitter do
  task :search do
    Search.find(:all).each { |s| s.poll }
  end
end

