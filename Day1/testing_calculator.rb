class StringCalculator
	# def add(input)
	# 	array_numbers = input.split(" ")
	# 	array_numbers.reduce(0) do |sum, num|
	# 		sum + num.chomp(",").to_i
	# 	end
	# 	#0
	# 	#6
	# 	#input.to_i
	# end
	def add(input)
		input = input.gsub(/\D/, " ") #\D lo que no son dígitos
		array_numbers = input.split(" ")
		array_numbers.reduce(0) do |sum, num|
			sum + num.to_i
		end
	end
	# def add(input)
	# 	input = input.gsub(/\D/, " ") #\D lo que no son dígitos
	# 	input.split(" ").reduce(0, :+.to_i)
	# end
end

#puts StringCalculator.new.add("20,:?2,   /43, 76, 90")

RSpec.describe "String calculator Test" do
	it "zero digits" do
		expect(StringCalculator.new.add("")).to eq(0)
	end
	it "string numbers separated by commas" do
		expect(StringCalculator.new.add("1, 2, 3")).to eq(6)
	end
	it "one digit" do
		expect(StringCalculator.new.add("3")).to eq(3)
	end
	it "two numbers separated by comma" do
		expect(StringCalculator.new.add("1, 2")).to eq(3)
	end
	it "two numbers separated by space" do
		expect(StringCalculator.new.add("1 2")).to eq(3)
	end
end