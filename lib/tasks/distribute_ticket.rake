namespace :distribute_ticket do
  desc "全ユーザーのticket_countを10増加させる"
  task execute: :environment do
    User.find_each do |user|
      begin
      user.increment!(:ticket_count, 10)
      rescue => e
        Rails.logger.debug e.message
      end
    end
  end
  desc "全ユーザーの中にticket_countが10枚追加されると最大値より大きくなるレコードがある場合に例外を発生させる"
  task raise: :environment do
    User.find_each do |user|
      begin
        if user.ticket_count > 2147483647 - 10
          raise RangeError, "#{user.id}は、チケット取得可能枚数の上限を超えてしまいます！"
        end
      rescue => e
        Rails.logger.debug e.message
      end
    end
  end

  desc "全ユーザーのticket_countをトランザクションで10増加させる"
  task transavt: :environment do
    ActiveRecord::Base.transactin do
      User.find_each do |user|
        user.increment!(:ticket_count, 10)
      end
    end
  end
end
