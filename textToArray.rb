puts ARGV[0]

line_num=0
text=File.open(ARGV[0]).read
text.gsub!(/\r\n?/, "\n")
topic = nil
good_paragraph = nil
improve_paragraph = nil
topic_array = [] #index 0 is topic name, index 1 is good paragraph, index 2 is improve paragraph
text.each_line do |line|
	if (line_num % 3 == 0)
		topic = line[3...line.size]
	elsif (line_num % 3 == 1)
		good_paragraph = line[3...line.size]
	elsif (line_num % 3 == 2)
		improve_paragraph = line[3...line.size]
		topic_array.push([topic, good_paragraph, improve_paragraph])
	end
  line_num += 1
end

# text.each_line do |line|
# 	print(line[0]) 
# 	if (line[0] == "1") #Topic name
# 		topic_array.push([topic, good_paragraph, improve_paragraph])
# 		getting_topic = true;
# 		line = line[3...line.size]
# 	elsif (line[0] == "2") #good paragraph
# 		getting_topic = false;
# 		getting_good = true;
# 		good_paragraph = ""
# 		line = line[3...line.size]
# 	elsif (line[0] == "3") #improvement paragraph
# 		getting_good = false;
# 		getting_improve = true;
# 		line = line[3...line.size]
# 	end
# 	if (getting_topic)
# 		topic = line
# 		good_paragraph = ""
# 		improve_paragraph = ""
# 	elsif (getting_good)
# 		good_paragraph += line
# 	elsif (getting_improve)
# 		improve_paragraph += line
# 	end
# end
topic_array.each do |t|
	array = t[1].split('. ')
	array.each_index do |i|
		array[i] += ". "
	end
	print array
end