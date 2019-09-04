##
# In this program I will represent fractions as an array
# of two integers, where the first element is the numerator
# and the second is the denominator

##
# Function to convert strings in the form [Integer_]Numerator/Denominator to my
# representation of fractions
def to_fraction(f)
  resultant_fraction = []

  integers = f.split("_")

  if integers.size > 1
    fraction = integers.last.split("/")
    resultant_fraction << integers.first.to_i * fraction.last.to_i + fraction.first.to_i
    resultant_fraction << fraction.last.to_i
  else
    fraction = integers.first.split("/")
    if fraction.size > 1
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
# Function to get the lowest possible denominator using the
def simplify_function(f)
end

def fraction_to_string(f)
  if f.first.abs > f.last
    if f.first % f.last == 0
      return (f.first / f.last).to_s
    else
      return (f.first / f.last).to_s + "_" + (f.first % f.last).to_s + "/" + f.last.to_s
    end
  else
    return (f.first.to_s + "/" + f.last.to_s)
  end
end

f1 = to_fraction(ARGV[0])

f2 = to_fraction(ARGV[2])

op = ARGV[1]

case op
when "+"
  puts fraction_to_string(add(f1, f2))
when "-"
  puts fraction_to_string(substract(f1, f2))
when "*"
  puts fraction_to_string(multiply(f1, f2))
when "/"
  puts fraction_to_string(divide(f1, f2))
else
  abort "Invalid Operator"
end
