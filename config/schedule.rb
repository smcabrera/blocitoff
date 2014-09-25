# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "./cron_log.log"
#
every 2.minutes do
  rake "todos:delete", :environment => "development"
end

#every 1.day do
#  rake "todos:delete", :environment => "production"
#end

