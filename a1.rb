# def make_proc(blck)
# 	blck
# end
# proc1 = make_proc{|x| p x}
# puts proc1.class

# print <<EOF
#    This is the first way of creating
#    here document ie. multiple line string.
# EOF

# print <<"EOF";                # same as above
#    This is the second way of creating
#    here document ie. multiple line string.
# EOF

# print <<`EOC`                 # execute commands
# 	echo hi there
# 	echo lo there
# EOC

# print <<`EOC`
#    echo hi shiva 
   
# EOC

puts "intializing block"
END {

	puts "this is end block"
}

BEGIN{
	puts "this is begin block"
}






