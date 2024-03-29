# Coding Challenge 

## Description

This program takes operations on fractions as input and returns a fractional result. Legal operators are \*, /, -, + (multiply, divide, substract, add). 

## Requirements

- Ruby version 2.5.*
- Rspec version 3.8.*

## Usage

- Operands and operators shall be separated by one or more spaces.
- Mixed numbers will be represented by whole_numerator/denominator. e.g. "3_1/4"
- Improper fractions and whole numbers are also allowed as operands.
```
  $ ruby main.rb 1/2 + 3_3/4
  4_1/4
```

## Test

To run the tests file just type:
```
  $ rspec .
```
## Important

To use the multiplication (asterisk symbol) you have to wrap it between simple or double quotes.
```
  $ ruby main.rb 1/2 '*' 3_3/4
  1_7/8
```

## Usage Examples
```
  $ ruby main.rb 1/2 + 3_3/4
  4_1/4
  
  $ ruby main.rb 2_3/8 + 9/8
  3_1/2
  
  $ ruby main.rb 5_1/8 / 35/8
  1_6/35
  
  $ ruby main.rb -5_1/8 - 5/7
  -5_47/56
```
