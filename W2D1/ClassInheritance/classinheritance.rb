class Employee
  attr_reader :name, :title, :salary, :boss, :reportees

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @reportees = nil
  end

  def bonus(multiplier)
    (@salary) * multiplier
  end


end

class Manager < Employee

  attr_writer :reportees


  def initialize(name, title, salary, boss)
    super
    @reportees = []
  end

  def bonus(multiplier)
    tot_subs_salary * multiplier
  end

  def tot_subs_salary
    result = []
    self.reportees.each do |employee|
      result << employee.salary
      if employee.reportees
        result << employee.tot_subs_salary
      end
    end
    result.reduce(0, :+)
  end
end

if __FILE__ == $0
  ned = Manager.new("Ned", "Founder", 1000000, nil)
  darren = Manager.new("Darren", 'TA Manager', 78_000, 'Ned')
  shawna = Manager.new('Shawna', 'TA', 12_000, 'Darren')
  david = Manager.new('David', 'TA', 10_000, 'Darren')
  rachel = Employee.new("Rachel", "student", 100, "David")
  drew = Employee.new("Drew", "student", 100, "David")
  darren.reportees = [david, shawna]
  ned.reportees = [darren]
  david.reportees = [rachel, drew]

  p ned.tot_subs_salary
end
