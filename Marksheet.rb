# # hash_arr = [{"rohilla" => "shivam","saini"=>"Deepesh"},{:sharma =>"shanu"},{:sharma =>"chetan"}]
# # puts hash_arr[2][]

# hash1 = Hash[:a1 => "alwar","a2" =>"rajasthan"]
#  hash1[:a1] = "India"
#  puts hash1[:a1]

# str = ["GFG", "G4G", "Sudo", "Geeks"]
 
# accessing multiple array elements

# a=["l","b","c"]
# a1=["l","b","c"]
# puts a[0,3]

# a = ["a","b","c"]
# p1=a.map { |e| e }
# print p1.class

# words = %w[this is a test]
# p Array.new(3){|i| i+1}

# class Box
# 	def initialize(w,h)
# 		@width,@height=w,h
# 	end
# 	def dispWidth
# 		return @width
# 	end
# 	def disHeigth
# 		return @height
# 	end
# end
# box = Box.new(10,20)
# puts box.dispWidth
# puts box.disHeigth

# def make_proc(&blck)
# 	blck.call
# end

# p1 = lambda{|s|  puts "hello"}
# puts p1.class

# a = [11,12,13,14]
# b = ["a","b","d","e","f"]
#   a.zip(b){|x=[]| print  x}
  
   
 # months = Hash.new()
 # puts "#{months[0]}"
 # puts "#{months[1]}"  
  
  
# hash = {:a =>"shiva", :b => "deep", " "=>"deepesh"}
# hash1 = {:c =>"shiva", :b => "deep"}
# puts hash[" "]

# $, = ", "
# months = Hash.new("month")
# months = {"1" =>"january", "2" =>"february"}


hash=Hash[:a,["a","b"],:b,["b","d"],:c,["c","e"]]
 #hash.each{|i,j| print "#{i}" "#{j}" }
 # hash.each_value{|i|  print i}
# hash.each_key{|i=[]| print i}
print hash.to_a.class







