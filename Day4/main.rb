fileObj = File.new("input.txt", "r")
sum = 0
size = 0

while (line = fileObj.gets)
	str = line.strip
    str = str.split(": ")[1]
	winNums = str.split(" | ")[0]
	myNums = str.split(" | ")[1]
	winNums = winNums.split(" ").map(&:to_i)
	myNums = myNums.split(" ").map(&:to_i)
	
	points = 0.5
	winNums.each do |x|
		if myNums.include? x
			points *= 2
		end
	end
	
	points = points.to_i 
	
	sum += points
	size += 1 # used for part 2
end
fileObj.close

print "Part 1: "
puts sum


fileObj = File.new("input.txt", "r")
sum = 0
copies = []
size.times do
	copies.push(1)
end

index = 0

while (line = fileObj.gets)
	
	str = line.strip
	str = str.split(": ")[1]
	winNums = str.split(" | ")[0]
	myNums = str.split(" | ")[1]
	winNums = winNums.split(" ").map(&:to_i)
	myNums = myNums.split(" ").map(&:to_i)
	
	cardsToCopy = 0
	winNums.each do |x|
		if myNums.include? x
			cardsToCopy += 1
		end
	end
	
	copies[index].times do	
		cardsToCopy.times { |i| copies[index + i + 1] += 1 }	
		sum += 1
	end
	index += 1 # used for part 2
end
fileObj.close

print "Part 2: "
puts sum