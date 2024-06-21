class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
    else
      delimiter = ","
    end

    number_array = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    negatives = number_array.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    number_array.sum
  end
end