test_users = (1..5).to_a.map do |n|
  User.new(
    username:     Faker::Name.name,
    email:    "test#{n}@example.com",
    password: "testtest"
  )
end

test_users.each do |user|
  user.skip_confirmation!
  user.save

  rand(3..5).times do
    app_name = Faker::App.name
    app = user.registered_applications.create!(
      name: app_name,
      url: "#{app_name.downcase}-test.io"
    )

    app.update_attribute(:created_at, rand(10.minutes .. 7.days).ago)
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
