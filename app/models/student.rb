class Student < ActiveRecord::Base
  before_save :marks_percent

  scope :topper, -> { where(" percentage > ?",75)}
  scope :medium, -> { where(" percentage > ? AND percentage < ?", 50, 75  )}
  scope :failure, -> { where(" percentage < ?", 50) }

  def marks_percent
    total_marks =  math + science + english
    self.percentage = (total_marks*100)/300.to_f
  end

end
