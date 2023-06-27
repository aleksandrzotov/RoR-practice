class PostToBanJob < ApplicationJob
  def perform
    reports_count_enough_for_ban = 5

    reports = Reaction.where(kind: 'report')
    reports_count_by_post_id = {}
    reports.each {|report| reports_count_by_post_id[report[:post_id]] = reports_count_by_post_id[report[:post_id]] == nil ? 1 : reports_count_by_post_id[report[:post_id]] + 1}
    reports_count_by_post_id.keys.filter {|key| reports_count_by_post_id[key] > reports_count_enough_for_ban}.each {|post_id| Post.find(post_id).update(is_banned: true)}
  end
end
