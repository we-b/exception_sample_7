users = []
10000.times do |i|
  users << User.new(name: "dummy-#{i+1}", ticket_count: 0)
end
User.import users
# ticket_countをint型で許容できる最大の値にする
User.find(500).update(ticket_count: 2147483647)
