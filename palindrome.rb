# discussed in 12/22/2015 interview with John
class Palindrome
  def is_Palindrome(string)
    string.reverse == string
  end
end

# (look_at_selenium_master) Sue Uyetake
# Topaz-Sue:mock_interview $ cat palindrome.rb
#
# class Palindrome
#   def is_Palindrome(string)
#     string.reverse == string
#   end
# end
#
#
#
# (look_at_selenium_master) Sue Uyetake
# Topaz-Sue:mock_interview $ ruby palindrome.rb
#
# (look_at_selenium_master) Sue Uyetake
# Topaz-Sue:mock_interview $ irb -r './palindrome.rb'
# 2.2.3 :001 > object = Palindrome.new
# => #<Palindrome:0x007fe03c05d538>
#   2.2.3 :002 > object.is_Palindrome('mom')
# => true
# 2.2.3 :003 > object.is_Palindrome('goo')
# => false

