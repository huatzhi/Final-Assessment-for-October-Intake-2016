# Create an admin user
AdminUser.create!(username:'admin', email:'admin@huatzhi.com', password:'huatzhi', password_confirmation:'huatzhi')
puts 'Created an AdminUser.'

ProUser.create!(username:'Pro User', email:'pro@user.com', password:'prouser', password_confirmation:'prouser')
puts 'Created a dummy ProUser'

# Create 100 ads by admin
pro_user = ProUser.first
100.times do |number|
  Ad.create!(
    title:"#{number} title", 
    price: number, 
    location: rand(0..13), 
    condition: rand(0..1), 
    contact_name: "Mr. #{number}",
    phone_number: (number*rand(100000..999999)).to_s,
    email: "test@test.test",
    description: "The description of #{number}.",
    user_id: pro_user.id
  )
end
puts '100 dummy ads created by admin'
