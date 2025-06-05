require "set"

class School
  def initialize
    @roster = Hash.new{|k,v|k[v] = SortedSet.new}
  end

  def add(name, grade)
    roster[grade].add(name)
  end

  def students_by_grade
    roster.sort.
           map{|grade, students| {grade: grade, students: students.to_a} }
  end

  def students(grade)
    roster[grade].to_a
  end

  private
  attr_reader :roster
end
