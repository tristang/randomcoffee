# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def pairing_email
    user_1 = User.new(
      first_name: "Sarah",
      last_name: "Smith",
      email: "sarah@gmail.com",
      department: Department.new(name: 'Marketing')
    )
    user_2 = User.new(
      first_name: "Iain",
      last_name: "Yang",
      email: "iain@gmail.com",
      department: Department.new(name: 'Sales')
    )
    UserMailer.pairing_email(user_1, user_2)
  end
end
