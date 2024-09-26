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

    @set_marks = Proc.new {
      |mrks,mrks_type| begin print"Enter #{mrks_type} Marks between 0-#{mrks}: "
      marks = gets.chomp.to_i
      if mrks > 20
        @theoritical_marks = marks
      else
        @practical_marks = marks
        end
      end while(marks < 0 || marks > mrks)
    }
  end

  def store_marks
    print"does #{@subjectname} has practicle ? if yes press (Y/y) else any key :"
    ask_practicle = gets.chomp
    if (ask_practicle == "Y" || ask_practicle == "y")
      @set_marks.call(80,"theoritical")
      @set_marks.call(20,"practical")
    else
      @set_marks.call(100,"theoritical")
      @practical_marks = 00
    end
    @student_subjmarks.store(@subjectname,theory_marks:@theoritical_marks,practical:@practical_marks)
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
    @student_subjmarks.each do |subj,markstype|  ;markstype.each{|type,marks| }
      @total_marks += markstype[:practical].to_i+markstype[:theory_marks].to_i
    end
    
    @percentage = @total_marks/@student_subjmarks.size.to_f
    @percentage = @percentage.round(2)
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
    puts "#{"subject".rjust(10)}" "#{"max_marks".rjust(20)}" "#{"obtained".rjust(20)}""#{"practical".rjust(20)}""#{"total".rjust(20)}""\n"
    @student_subjmarks.each{|subj,markstype| print "#{subj.to_s.rjust(10)}""#{100.to_s.rjust(18)}""#{markstype[:theory_marks].to_i.to_s.rjust(18)}"
    print "#{markstype[:practical].to_i.to_s.rjust(20)}" "#{(markstype[:practical].to_i+markstype[:theory_marks].to_i).to_s.rjust(22)}"
    print " D\n" if (markstype[:practical].to_i+markstype[:theory_marks].to_i) >= 75; puts "" }
    print "=========================================================================================================\n"
    print "         grade: #{@grade}" "                  percentage is #{@percentage}%\n"
    if @percentage > 33.00
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
