##
# In this program I will represent fractions as an array
# of two integers, where the first element is the numerator
# and the second is the denominator.


##
# Function to convert strings in the form [Integer_]Numerator/Denominator to my
# representation of fractions
# f - string representing a fraction
# return - array of size 2 where the first element is the numerator and the second is the denominator.
def to_fraction(f)
  resultant_fraction = []

  integers = f.split("_") # Checking for a mixed number

  if integers.size > 1 # If mixed number found
    fraction = integers.last.split("/") # Obtaining
    if integers.first[0] == "-"   # Checking if the integer is negative
      resultant_fraction << integers.first.to_i * fraction.last.to_i - fraction.first.to_i
    else
      resultant_fraction << integers.first.to_i * fraction.last.to_i + fraction.first.to_i
    end
    resultant_fraction << fraction.last.to_i
  else
    fraction = integers.first.split("/")
    if fraction.size > 1 # Checking for only integers numbers
      resultant_fraction << fraction.first.to_i
      resultant_fraction << fraction.last.to_i
    else
      resultant_fraction << fraction.first.to_i
      resultant_fraction << 1
    end
  end
  return resultant_fraction
end

##
# Implementation of operations with fractions

def multiply(fraction_1, fraction_2)
  result = []
  result << fraction_1.first * fraction_2.first
  result << fraction_1.last * fraction_2.last
  return result
end

def add(fraction_1, fraction_2)
  result = []
  result << (fraction_1.first * fraction_2.last) + (fraction_2.first * fraction_1.last)
  result << fraction_1.last * fraction_2.last
  return result
end

def substract(fraction_1, fraction_2)
  result = []
  result << (fraction_1.first * fraction_2.last) - (fraction_2.first * fraction_1.last)
  result << fraction_1.last * fraction_2.last
  return result
end

def divide(fraction_1, fraction_2)
  result = []
  result << fraction_1.first * fraction_2.last
  result << fraction_2.first * fraction_1.last
  return result
end

##
# Function to get the lowest possible denominator, searching for the highest
# common divisor
# f - array of size 2 representing a fraction
# return - array of size 2 with the lowest possible denominator
def simplify_fraction(f)
  iterator = 1
  maximum_divisible_number = 1
  while iterator <= f.last
    if f.first % iterator == 0 and f.last % iterator == 0 
      maximum_divisible_number = iterator
    end
    iterator += 1
  end
  return [(f.first / maximum_divisible_number), (f.last / maximum_divisible_number)]
end

##
# Function to convert my representation of fractions in the desired string
# representation
# f - array of size 2 representing a fraction
# return - string representing a mixed number from the array input
def fraction_to_string(f)
  f = simplify_fraction(f)
  if f.first.abs >= f.last # Checking for improper fraction
    if f.first % f.last == 0 # Checking for only return integer
      return (f.first / f.last).to_s
    else # Not exact integer, returning mixed number
      f.first < 0 ? # Checking if the integer is negative, Ruby gives the
                    # following output to integer division with negative values:
                    # -31/4 = -8 which is wrong for our purposes
        (return "-" + (f.first.abs / f.last).to_s + "_" +
        (f.first.abs % f.last).to_s + "/" + f.last.to_s)
      :
        (return (f.first / f.last).to_s + "_" + (f.first % f.last).to_s + "/" +
        f.last.to_s)
    end
  else
    f.last == 1 ? (return f.first.to_s) : (return (f.first.to_s + "/" +
      f.last.to_s))
  end
end

##
# Main function to start the process
def operate_fractions(f1, op, f2)
  f1 = to_fraction(f1)
  f2 = to_fraction(f2)
  case op
  when "+"
    fraction_to_string(add(f1, f2))
  when "-"
    fraction_to_string(substract(f1, f2))
  when "*"
    fraction_to_string(multiply(f1, f2))
  when "/"
    fraction_to_string(divide(f1, f2))
  else
    abort "Invalid Operator"
  end
end
