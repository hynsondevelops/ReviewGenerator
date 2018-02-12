# encoding: utf-8

line_num=0
text=File.open("finalSentences.txt").read
topics = []
sentencesArray = []
text.each_line do |line|
	if (line_num % 2 == 0)
		topics.push(line[0..line.length - 3])
	elsif (line_num % 2 == 1)
		sentencesArray.push(line[0..line.length - 3])
	end
  line_num += 1
end


sentencesArray.each_with_index do |sentence, index|
	sentencesArray[index] = sentence.split('. ')
end
topics.each_with_index do |topic, index|
	print "var #{topic}SentenceBank = #{sentencesArray[index]};\n"
end