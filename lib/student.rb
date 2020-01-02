class Student

  attr_reader :student

  def initialize(name, cohort)
    @student = {name: name, cohort: cohort.to_sym}
  end

end
