module Actualize
  module EmailReportable
    def send_report
      puts "Sending report email..."
      # use email sending library...
      puts "Email sent!"
    end

    def cancel_report
    end
  end

  class Employee
    attr_reader :first_name, :last_name, :active
    attr_writer :active

    def initialize(input_options)
      @first_name = input_options[:first_name]
      @last_name = input_options[:last_name]
      @salary = input_options[:salary]
      @active = input_options[:active]
    end

    def print_info
      puts "#{@first_name} #{@last_name} makes #{@salary} a year."
    end

    def give_annual_raise
      @salary = 1.05 * @salary
    end
  end

  class Manager < Employee
    include EmailReportable

    def initialize(input_options)
      super(input_options)
      @employees = input_options[:employees]
    end

    def give_all_raises
      @employees.each do |employee|
        employee.give_annual_raise
      end
    end

    def fire_all_employees
      @employees.each do |employee|
        employee.active = false
      end
    end
  end

  class Intern < Employee
    include EmailReportable
  end
end

employee1 = Actualize::Employee.new({ first_name: "Majora", last_name: "Carter", salary: 80000, active: true })
employee2 = Actualize::Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee1.print_info
employee2.print_info

manager = Actualize::Manager.new(
  first_name: "Saron",
  last_name: "Yitbarek",
  salary: 100000,
  active: true,
  employees: [employee1, employee2],
)
manager.print_info
manager.send_report
p manager
manager.give_all_raises
employee1.print_info
employee2.print_info
manager.fire_all_employees
p employee1
p employee2

intern = Actualize::Intern.new(first_name: "Adrienne", last_name: "Lowe", salary: 50000, active: true)
intern.print_info
intern.send_report
