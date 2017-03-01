test_users = (1..5).map do |n|
  User.new(
    username:     Faker::Name.name,
    email:        "test#{n}@example.com",
    password:     "testtest"
  )
end

# Test User is for a sample account for first time user.
test_users.push(User.new(username: "Test User", email: "test@test.io", password: "testtest"))

test_users.each do |user|
  user.skip_confirmation!
  user.save

  rand(2..4).times do
    app_name = Faker::App.name
    app = user.registered_applications.create!(
      name: app_name,
      url: "http://#{app_name.downcase.split(' ').join('-')}.io"
    )

    app.update_attribute(:created_at, rand(10.minutes .. 7.days).ago)
  end
end
apps = RegisteredApplication.all

names = ["Click on ad", "Join email list", "View main page", "Share the section", "Edit user's profile" ]

apps.each do |app|
  rand(10..20).times do
    event = app.events.create!(
      name: names.sample
    )
    event.update_attribute(:created_at, rand(10.minutes .. 7.days).ago)
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
