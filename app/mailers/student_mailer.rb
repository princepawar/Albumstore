class StudentMailer < ApplicationMailer
  default from: "from@example.com"

  def welcome_email(student_id)
    @students = Student.find(student_id)
        mail(to: @students.email, subject: 'Sample Email')
  end
end

