namespace :student  do
  desc "create some fake data"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    i = 1
    while i <= 200
      i= i + 1
      student = Student.new
      student.name = Faker::Name.name
      student.email = Faker::Internet.email
      student.math = Faker::Number.decimal(2, 2)
      student.science = Faker::Number.decimal(2, 2)
      student.english = Faker::Number.decimal(2, 2)
      student.save!
    end

    # Student.populate 200 do |student|
    #   student.name = Faker::Name.name
    #   student.email = Faker::Internet.email
    #   student.math = Faker::Number.decimal(2, 2)
    #   student.science = Faker::Number.decimal(2, 2)
    #   student.english = Faker::Number.decimal(2, 2)
    #   puts "#{student.id}"
    # end
  end
end
