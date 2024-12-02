def isSymbol(c)
	if (not (c == '.') and not (c.match?(/[0-9]/)))
		return true
	else
		return false
	end
end

fileObj = File.new("input.txt", "r")
row = 0
column = 0
input = Hash.new
while (line = fileObj.gets)
	str = line.strip
    str.split("").each do |char|
		input[[row, column]] = char
		column += 1
	end
	row += 1
	column = 0
end
fileObj.close

size = 140

sum = 0

i = 0
while i < size
	j = 0
	while j < size
		num = ""
		isValid = false
		if input[[i , j]].match?(/[0-9]/)
			while input[[i, j]].match?(/[0-9]/)
				num += input[[i, j]]
				
				for a in -1..1	# Checks for adjacent symbols
					if i + a >= 0 and i + a < size
						for b in -1..1
							if j + b >= 0 and j + b < size
								if isSymbol(input[[(i + a), (j + b)]])
									isValid = true
								end
							end
						end
					end
				end
				
				j += 1
				if(j >= size)
					break
				end
			end
		end
		if isValid
			num = num.to_i
			sum += num
		end
		j += 1
	end
	i += 1
end

print "Part 1: "
puts sum



sum = 0

i = 0
while i < size
	j = 0
	while j < size
		if input[[i , j]] == '*'
			firstNumFound = false
			num1 = 0
			num2 = 0
			for a in -1..1
				if i + a >= 0 and i + a < size
					for b in -1..1
						if j + b >= 0 and j + b < size
							if (input[[(i + a), (j + b)]]).match?(/[0-9]/)
								start = 0
								while(start + j + b >= 0) and (input[[(i + a), (start + j + b)]].match?(/[0-9]/) )
									start -= 1
								end
								start = start + j + b + 1
								
								num = ""
								for x in start..(size - 1)
									if not input[[(i + a), x]].match?(/[0-9]/)
										break
									end
									num += input[[(i + a), x]]
								end
								num = num.to_i
								
								if not firstNumFound
									num1 = num		
									firstNumFound = true
								elsif not num == num1
									num2 = num
								end
							end
						end
					end
				end
			end
			if not num2 == 0
				sum += (num1 * num2)
			end
		end	
		j += 1
	end
	i += 1
end

print "Part 2: " # In my humble opinion, this day is fucking evil
puts sum
