class Marksheet 
       
        def subjctrelated_block
          @ask_subjectadd = lambda{print"Do you want to add subject if yes then press Y else any key:";@ask_subj = gets.chomp}
          @add_sbjectblck = lambda{print"subject name: ";@subjectname = gets.chomp.to_sym}
        end

        def setmarks(mrks,subtype) 
         mrks = mrks;subtype = subtype
         begin
            print"Enter #{subtype} Marks between 0-#{mrks}: "
            marks = gets.chomp.to_i
          end while(marks<0 || marks>mrks) 
        end


        def store_marks
         print"does #{@subjectname} has practicle ? if yes press (Y/y) else any key"
         ask_practicle = gets.chomp
         if (ask_practicle == "Y" || ask_practicle == "y")
         
          begin
            print"Enter Marks between 0-80: "
            marks = gets.chomp.to_i
          end while(marks<0 || marks>80)
         
          begin
            print"Enter practicle marks between 0-20 : "
            prctcl_marks = gets.chomp.to_i
          end while (prctcl_marks<0 || prctcl_marks>20)
        
        else
          begin
            print"enter #{@subjectname} marks between 0-100 : "
            marks = gets.chomp.to_i
            prctcl_marks == 00
          end while (marks<0 || marks>100)
          end
          @student_subjmarks.store(@subjectname,theory:marks,practicle:prctcl_marks)
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
           @total=0
           @percentage =0
           @grade=""

          @student_subjmarks.each{|subj,mark| p "#{subj} #{mark}"}
          
        end
 







  # def stdntmark_calculation
  #    #   @studentmarks.each{|key,value| @total += (value[0] + value[1] )}
  #   @percentage=(@total/@maxmarks).round(2)
  #   case @percentage
  #   when 90..100
  #     @grade="A+"
  #   when 75...90
  #     @grade="A"
  #   when 60...75
  #     @grade="B+"
  #   when 45...60
  #     @grade="B"
  #   when 33...45
  #     @grade="C"
  #   end
  # end
  #   def print_marksheet
  #     puts "                            Board Of Secondary Education Rajasthan Ajmer"
  #     print "---------------------------#{@studentinfo["name"]}'s result---------------------------------------------\n"
  #     @studentinfo.each{|name,value| puts "#{name}: #{value}"}
  #     puts"=========================================================================================================="
  #     puts "#{"subject".rjust(10)}""#{"obtained".rjust(20)}""#{"practicle".rjust(20)}""#{"total".rjust(20)}""\n"
  #     @studentmarks.each{|key,value| puts "#{key.rjust(10)}""#{value[0].to_s.rjust(19)}""#{value[1].to_s.rjust(20)}""#{(value[0]+value[1]).to_s.rjust(20)}"}
  #     print "=========================================================================================================\n"
  #     print "         grade: #{@grade}" "                  percentage is #{@percentage}%\n"   
  #     if @percentage>33.00
  #       print "=========================     PASS    ================================================================="
  #     else
  #       print "=========================     FAIL    ================================================================="
  #     end
  #   end
   end
obj1 = Marksheet.new
obj1.student_detail

obj1.stdntmark_calculation
# obj1.print_marksheet