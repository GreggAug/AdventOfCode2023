def spelledToDigit(s)
	s.gsub!('one', 'one1one')
	s.gsub!('two', 'two2two')
	s.gsub!('three', 'three3three')
	s.gsub!('four', 'four4four')
	s.gsub!('five', 'five5five')
	s.gsub!('six', 'six6six')
	s.gsub!('seven', 'seven7seven')
	s.gsub!('eight', 'eight8eight')
	s.gsub!('nine', 'nine9nine')
	
	return s
end

fileObj = File.new("input.txt", "r")
sum = 0
while (line = fileObj.gets)
    line.split("").each do |i|
		if i.match?(/[0-9]/)
			sum += (10 * i.to_i)
			break
		end
	end
    line.reverse.split("").each do |i|
		if i.match?(/[0-9]/)
			sum += (i.to_i)
			break
		end
	end
end

fileObj.close

print "Part 1: "
puts sum


fileObj = File.new("input.txt", "r")
sum = 0
while (line = fileObj.gets)
	str = spelledToDigit(line)
    str.split("").each do |i|
		if i.match?(/[0-9]/)
			sum += (10 * i.to_i)
			break
		end
	end
    str.reverse.split("").each do |i|
		if i.match?(/[0-9]/)
			sum += (i.to_i)
			break
		end
	end
end

fileObj.close

print "Part 2: "
puts sum