fileObj = File.new("input.txt", "r")
sum = 0
gameNum = 1
while (line = fileObj.gets)
	str = line.strip # Doesn't work if I don't strip the trailing whitespace
	str = str.gsub(";", ",")
	str = str.gsub(" ", "")
	str = str.split(':')[1]
	possible = true
    str.split(",").each do |round|
		num = "";
		round.split("").each do |i|
			if i.match?(/[0-9]/)
				num += i
			end
		end
		num = num.to_i
		
		color = "";
		round.split("").each do |i|
			if not i.match?(/[0-9]/)
				color += i
			end
		end
		
		if color == "blue"
			possible = (num <= 14)
		elsif color == "green"
			possible = (num <= 13)
		elsif color == "red"
			possible = (num <= 12)
		end
		if !possible 
			break
		end
	end
	if possible
		sum += gameNum
	end
	gameNum += 1
end

fileObj.close

print "Part 1: "
puts sum



def max (a,b)
  a>b ? a : b
end

fileObj = File.new("input.txt", "r")
sum = 0
while (line = fileObj.gets)
	str = line.strip # Doesn't work if I don't strip the trailing whitespace
	str = str.gsub(";", ",")
	str = str.gsub(" ", "")
	str = str.split(':')[1]
	minBlue = 0
	minGreen = 0
	minRed = 0
    str.split(",").each do |round|
		num = "";
		round.split("").each do |i|
			if i.match?(/[0-9]/)
				num += i
			end
		end
		num = num.to_i
		
		color = "";
		round.split("").each do |i|
			if not i.match?(/[0-9]/)
				color += i
			end
		end
		
		if color == "blue"
			minBlue = max(minBlue, num)
		elsif color == "green"
			minGreen = max(minGreen, num)
		elsif color == "red"
			minRed = max(minRed, num)
		end
	end
	sum += (minBlue * minGreen * minRed)
end

fileObj.close

print "Part 2: "
puts sum