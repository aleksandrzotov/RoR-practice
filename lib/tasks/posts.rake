# frozen_string_literal: true

namespace :posts do
  desc "Create post"
  task :create_post, [:user_id, :text] => :environment do |t, args|
    puts(args[:user_id], args[:text])
    Post.create(user_id: args[:user_id], text: args[:text])
  end

  desc "Ban post"
  task ban_post: :environment do
    puts('ban')

    reports_count_enough_for_ban = 5

    reports = Reaction.where(kind: 'report')
    reports_count_by_post_id = {}
    reports.each {|report| reports_count_by_post_id[report[:post_id]] = reports_count_by_post_id[report[:post_id]] == nil ? 1 : reports_count_by_post_id[report[:post_id]] + 1}
    reports_count_by_post_id.keys.filter {|key| reports_count_by_post_id[key] > reports_count_enough_for_ban}.each {|post_id| Post.find(post_id).update(is_banned: true)}
  end

  task ban_post_2: :environment do
    puts('ban 2')
    p post = Post.create(user_id: 1, text: 'aaaaa')
    7.times {Reaction.create(user_id: 2, post_id: post.id, kind: 'report')}
    result = Posts::MarkAsBan.call
    p result.success?
    p result.fail?
    p post.reload
  end

  desc "Archive post"
  task archive_post: :environment do
    puts('archive')
    posts = Post.where(['created_at < ?', 1.days.ago]).where(is_archived: false)
    posts.each {|post| post.update(is_archived: true)}
  end
end
