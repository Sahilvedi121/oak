class Marksheet

  def subjctrelated_block
    @ask_subjectadd = lambda {
      print"Do you want to add subject if yes then press Y else any key:"
      @ask_subj = gets.chomp
    }

    @add_sbjectblck = lambda {
      print"subject name: "
      @subjectname = gets.chomp.to_sym
    }
  end

  def setmarks(mrks,subtype)
    begin
      print"Enter #{subtype} Marks between 0-#{mrks}: "
      marks = gets.chomp.to_i
      if (subtype == "theoritical")
        @theory_marks = marks
      else
        @practical_marks = marks
      end
    end while(marks < 0 || marks > mrks)
  end

  def store_marks
    print"does #{@subjectname} has practical ? if yes press (Y/y) else any key "
    ask_practical = gets.chomp
    if (ask_practical == "Y" || ask_practical == "y")
      setmarks(80,"theoritical")
      setmarks(20,"practical")
    else
      setmarks(100,"theoritical")
      @practical_marks = 00
    end
    @student_subjmarks.store(@subjectname,{theory_marks:@theory_marks,practical:@practical_marks})
  end

  def student_detail
    @studentinfo = {}
    @student_subjmarks = {}

    print "Enter student name:"
    @studentinfo[:name] = gets.chomp

    print"Enter student father name:"
    @studentinfo[:fathername] = gets.chomp

    print"Enter student mother name:"
    @studentinfo[:mothername] = gets.chomp

    subjctrelated_block
    @ask_subjectadd.call

    begin
      if (@ask_subj == "y" || @ask_subj == "Y")
        @add_sbjectblck.call
        store_marks
      else break
      end
      @ask_subjectadd.call
    end while (@ask_subj == "y" || @ask_subj == "Y")
  end

  def stdntmark_calculation
    @total_marks = 0
    @student_subjmarks.each do |subj,markstype|
      @total_marks += markstype.values.sum
    end
    @percentage = @total_marks/@student_subjmarks.size.to_f
    @percentage =@percentage.round(2)
    case @percentage
    when 90..100
      @grade="A+"
    when 75...90
      @grade="A"
    when 60...75
      @grade="B+"
    when 45...60
      @grade="B"
    when 33...45
      @grade="C"
    end
  end
  
  def print_marksheet
    puts "                            Board Of Secondary Education Rajasthan Ajmer"
    print "---------------------------#{@studentinfo[:name]}'s result---------------------------------------------\n"
    @studentinfo.each{|name,value| puts "#{name}: #{value}"}
    puts"=========================================================================================================="
    puts "#{"subject".rjust(10)}""#{"obtained".rjust(20)}""#{"practical".rjust(20)}""#{"total".rjust(20)}""\n"
    @student_subjmarks.each{|subj,markstype| print "#{subj.to_s.rjust(10)}" "#{markstype[:theory_marks].to_i.to_s.rjust(18)}"
    print "#{markstype[:practical].to_i.to_s.rjust(20)}" "#{markstype.values.sum.to_s.rjust(20)}"
    print " D" if (markstype.values.sum) >= 75 ; print "\n" }
    print "=========================================================================================================\n"
    print "         grade: #{@grade}" "                  percentage is #{@percentage}%\n"
    if @percentage>33.00
      print "=========================     PASS    ================================================================="
    else
      print "=========================     FAIL    ================================================================="
    end
  end
end
   
obj1 = Marksheet.new
obj1.student_detail
obj1.stdntmark_calculation
obj1.print_marksheet