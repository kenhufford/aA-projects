class Employee
  
  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.add_employee(self) if boss != nil
  end

  def bonus(multiplier)
    salary * multiplier 
  end

  protected
  attr_reader :name, :title, :salary, :boss
end

class Manager < Employee

  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    self.sum_employee_salaries * multiplier
  end

  def sum_employee_salaries
    # return self.salary if !self.is_a?(Manager)
    sum = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
       sum+= employee.sum_employee_salaries
      end
      sum+= employee.salary
    end
    sum
  end

  def add_employee(employee)
    @employees << employee
  end

  private
  attr_reader :employees
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA MAnager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000