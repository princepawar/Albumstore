class StudentsController < ApplicationController

  def index
    # @students = Student.all
    render 'index', locals: {stage: 0}
  end

  def edit
  end

  def new
  end

  def update
  end


  def create
  end

  def send_email

    StudentsWorker.perform_async(1)

    # Student.find_each(batch_size: 10) do |student|
    #    StudentMailer.welcome_email(student).deliver
    #    # flash[:notice] = "Mail delivered"
    #    # redirect_to root_path
    # end
  end


  def topper
    # @topper_student = Student.where(" percentage > ?",75)
    @topper_student = Student.topper
    render 'index', locals: {stage: 1}
  end

  def medium
    #@average_student = Student.where(" percentage > ? AND percentage < ?", 50, 75  ) # .pluck(:percentage)
    @average_student = Student.medium
    render 'index', locals: {stage: 2}
  end

  def failure
    #@failure_student  = Student.where(" percentage < ?", 50)
    @failure_student = Student.failure
    render 'index', locals: {stage: 3}
  end
end
