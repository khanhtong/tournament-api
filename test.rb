string2 = 'Mark Zuckerberg gave up	'
string = '4-6	'

puts string.class

if string.include? '-'
  puts string.split('-')[0]
  # puts
else
  puts string.split(' ')
end