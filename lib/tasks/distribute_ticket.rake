namespace :distribute_ticket do
  desc "全ユーザーのticket_countを10増加させる"
  task execute: :environment do
    User.find_each do |user|
      user.increment!(:ticket_count, 10)
    end
  end
end
