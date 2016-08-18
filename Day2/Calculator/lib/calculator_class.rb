class Calculator
    def self.add(first_number, second_number)
        first_number + second_number
    end
    def self.subtract(first_number, second_number)
        first_number - second_number
    end
    def self.multiply(first_number, second_number)
        first_number * second_number
    end
    def self.divide(first_number, second_number)
        first_number / second_number
    end
    def self.select_operation(first_number, second_number, operation)
        case operation
            when "addition"
                add(first_number, second_number)
            when "subtract"
                subtract(first_number, second_number)
            when "multiply"
                multiply(first_number, second_number)
            when "divide"
                divide(first_number, second_number)
        end
    end
end