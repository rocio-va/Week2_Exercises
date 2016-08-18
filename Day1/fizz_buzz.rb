class FizzBuzz
	def divisible_by_3(num)
		#num
		if(num % 3 == 0)
			"Fizz"
		else
			""
		end
	end
	def divisible_by_5(num)
		if(num % 5 == 0)
			"Buzz"
		else
			""
		end
	end
	def number_to_FizzBuzz (num)
		result = divisible_by_3(num) + divisible_by_5(num)
		if(result == "")
			result = num
		end
		result
	end
end

RSpec.describe "Testing Fizz Buzz" do
	let (:test){FizzBuzz.new}
	it "not_divisible_by_3" do
		expect(test.number_to_FizzBuzz(1)).to eq(1)
	end
	it "divisible_by_3" do
		expect(test.number_to_FizzBuzz(3)).to eq("Fizz")
	end
	it "not_divisible_by_5" do
		expect(test.number_to_FizzBuzz(6)).to eq("Fizz")
	end
	it "divisible_by_5" do
		expect(test.number_to_FizzBuzz(5)).to eq("Buzz")
	end
	it "divisible_by_5" do
		expect(test.number_to_FizzBuzz(15)).to eq("FizzBuzz")
	end


end