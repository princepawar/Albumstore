class StudentsWorker
  include Sidekiq::Worker

  def perform
    #Student.create
    puts "this is only for testing"
    #student = Student.find(student_id)
    # uri = URI.parse("http://students.appspot.com/")
    # request = Net::HTTP.post_form(uri, lang: snippet.language, code: snippet.plain_code)
    # student.update_attribute(:highlighted_code, request.body)


     Student.all.each do |student|
        StudentMailer.welcome_email(student).deliver
        # flash[:notice] = "Mail delivered"
        # redirect_to root_path
     end
  end
end
