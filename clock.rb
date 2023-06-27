require 'clockwork'
include Clockwork

require_relative './config/environment'
require_relative './config/boot'

handler do |job|
  puts "Running #{job}"
end

every(30.seconds, 'archive_old_posts') do
  PostArchiverJob.perform_later
end

every(40.seconds, 'post_to_ban') do
  PostToBanJob.perform_later
end
