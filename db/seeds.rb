User.create!(
  first_name: 'Admin',
  last_name: 'User',
  email: '1@yopmail.com',
  password: '123456',
  password_confirmation: '123456',
  admin: true,
  address: 'Ongraph technologies jaipur',
  mobile_no: 1234567890,
  city: 'jaipur',
  state: 'Rajasthan',
  user_role: 'Job Seeker',
  pincode: '123456'
)

User.create!(
  first_name: 'Employer',
  last_name: 'User',
  email: '2@yopmail.com',
  password: '123456',
  password_confirmation: '123456',
  admin: false,
  address: 'Ongraph technologies jaipur',
  state: 'Rajasthan',
  user_role: 'Employer',
  pincode: '123456',
  mobile_no: 1234567890,
  city: 'jaipur'
)

User.create!(
  first_name: 'JobSeeker',
  last_name: 'User',
  email: '3@yopmail.com',
  password: '123456',
  password_confirmation: '123456',
  admin: false,
  address: 'Ongraph technologies jaipur',
  state: 'Rajasthan',
  user_role: 'Job Seeker',
  pincode: '123456',
  mobile_no: 1234567890,
  city: 'jaipur'
)
