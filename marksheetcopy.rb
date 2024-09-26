
	puts "-----------Board Of Secondary Education Rajasthan Ajmer-----------"


class Marksheet 


  def student_detail
    @studentinfo={}
    @studentmarks={}
    print"Enter student name:"
    @studentinfo["name"]=gets.chomp
    print"Enter student father name:"
    @studentinfo["fathername"]=gets.chomp
    print"Enter student mother name:"
    @studentinfo["mothername"]=gets.chomp

    for i in (1..5)
      print"Enter subject name:"
      subjectname=gets.chomp
      print"Enter marks:"
      marks=gets.chomp.to_i
      print"practicle marks for #{subjectname} ==> if yes then press Y/y else any "
      str=gets.chomp
      if (str=='Y'||str=='y')
        print"Enter #{subjectname} practicle marks:"
        prctclmarks=gets.chomp.to_i
        @studentmarks.store(subjectname.to_s,[marks,prctclmarks])
      else
        prctclmarks=0
      @studentmarks.store(subjectname.to_s,[marks,prctclmarks])
      end

    end
    p@studentmarks
    print@studentinfo
  end

  def stdntmark_calculation
  
    
  end

  #   	@percentage =  @total/5.0
  #    print "     percentage-#{ @percentage}%"
    
  #    if (@percentage > 33.0)
  #    	case @percentage
  #   	when 90..100
  #         @grade = "A+"
  #   	when 75...90
  #   	  @grade = "A"	
  #   	when 60...75
  #   		@grade = "B+"
  #   	when 50...60
  #   		@grade = "B"	
  #   	when 33...50
  #   	   @grade = "C"
  #   	else
  #   	   @grade = "C-"	
  #       end

  #     end 
  #     if (@percentage > 33.0)
  #     	@result = "PASS"
  #     	else
  #     		@result = "FAIL"
  #     end

  # end

  # def print_marksheet
  #  puts "   Grade :----#{@grade}"
  #  puts "                           Result:---- #{@result}"

  	
  # end


end
obj1 = Marksheet.new
obj1.student_detail
# obj1.calculate_grade  
# obj1.print_marksheet