namespace :votes do
  desc "Check time to life of petitions"
  task VotingEndingJob: :environment do
    article = Article.where(expired: false)
    article.each do |p|
      votes = p.votes.count
      if p.expired?(p.created_at)
        p.update(expired: true)
        UserMailer.votes_time_expired(p, votes).deliver_later
      end
    end
  end
end 
