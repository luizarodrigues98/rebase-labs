Dir["./app/jobs/*.rb"].each { |file| require file unless file.include?('application') }
