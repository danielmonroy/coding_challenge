##
# Testing example cases and custom cases
#

require_relative '../fractions.rb'

##
# Testing main function
#
describe '#operate_fractions with given example cases' do
  it 'operate 1/2 * 3_3/4' do
    expect(operate_fractions("1/2", "*", "3_3/4")).to eq("1_7/8")
  end

  it 'operate 2_3/8 + 9/8' do
    expect(operate_fractions("2_3/8", "+", "9/8")).to eq("3_1/2")
  end

  it 'operate 5_1/8 / 35/8' do
    expect(operate_fractions("5_1/8", "/", "35/8")).to eq("1_6/35")
  end

  it 'operate -5_1/8 / 35/8' do
    expect(operate_fractions("-5_1/8", "/", "35/8")).to eq("-1_6/35")
  end

  it 'operate -5_1/8 - 5/7' do
    expect(operate_fractions("-5_1/8", "-", "5/7")).to eq("-5_47/56")
  end
end

##
# Testing conversion of string to array
#
describe '#to_fraction with custom inputs' do
  it 'converts -5_1/4 to -21/4' do
    expect(to_fraction("-5_1/4")).to eq([-21,4])
  end

  it 'converts -5_30/4 to -50/4' do
    expect(to_fraction("-5_30/4")).to eq([-50,4])
  end

  it 'converts 1_1/2 to 3/2' do
    expect(to_fraction("1_1/2")).to eq([3,2])
  end

  it 'converts 5/2 to 5/2' do
    expect(to_fraction("5/2")).to eq([5,2])
  end
end

##
# Testing simplification
#
describe '#simplify_fraction with custom inputs' do
  it 'simplifies -62/8 to -31/4' do
    expect(simplify_fraction([-62,8])).to eq([-31,4])
  end

  it 'simplifies -2/8 to -1/4' do
    expect(simplify_fraction([-2,8])).to eq([-1,4])
  end

  it 'simplifies -50/7 to -50/7' do
    expect(simplify_fraction([-50,7])).to eq([-50,7])
  end

  it 'simplifies -300/10 to -30/1' do
    expect(simplify_fraction([-300,10])).to eq([-30,1])
  end
end

##
# Testing conversion of array to string
#
describe '#fraction_to_string with custom inputs' do
  it 'converts -31/4 to -7_3/4' do
    expect(fraction_to_string([-31,4])).to eq("-7_3/4")
  end

  it 'converts -50/7 to -7_1/7' do
    expect(fraction_to_string([-50,7])).to eq("-7_1/7")
  end

  it 'converts 15/3 to 5' do
    expect(fraction_to_string([15,3])).to eq("5")
  end

  it 'converts 3/8 to 3/8' do
    expect(fraction_to_string([3,8])).to eq("3/8")
  end

  it 'converts 49/5 to 9_4/5' do
    expect(fraction_to_string([49,5])).to eq("9_4/5")
  end
end

##
# Testing multiplication
#
describe '#operate_fractions multiply' do
  it 'operate fractions 3/7 * 1/3' do
    expect(operate_fractions("3/7", "*", "1/3")).to eq("1/7")
  end

  it 'operate mixed numbers 10_1/2 * 2' do
    expect(operate_fractions("10_1/2", "*", "2")).to eq("21")
  end

  it 'operate improper fractions 30/7 * 1/3' do
    expect(operate_fractions("30/7", "*", "1/3")).to eq("1_3/7")
  end
end

##
# Testing division
#
describe '#operate_fractions divide' do
  it 'operate fractions 3/7 / 1/3' do
    expect(operate_fractions("3/7", "/", "1/3")).to eq("1_2/7")
  end

  it 'operate mixed numbers 10_1/2 / 2' do
    expect(operate_fractions("10_1/2", "/", "2")).to eq("5_1/4")
  end

  it 'operate improper fractions 30/7 / 1/3' do
    expect(operate_fractions("30/7", "/", "1/3")).to eq("12_6/7")
  end
end

##
# Testing addition
#
describe '#operate_fractions add' do
  it 'operate fractions 3/7 + 1/3' do
    expect(operate_fractions("3/7", "+", "1/3")).to eq("16/21")
  end

  it 'operate mixed numbers 10_1/2 + 2' do
    expect(operate_fractions("10_1/2", "+", "2")).to eq("12_1/2")
  end

  it 'operate improper fractions 30/7 + 1/3' do
    expect(operate_fractions("30/7", "+", "1/3")).to eq("4_13/21")
  end
end

##
# Testing substraction
#
describe '#operate_fractions substract' do
  it 'operate fractions 3/7 - 1/3' do
    expect(operate_fractions("3/7", "-", "1/3")).to eq("2/21")
  end

  it 'operate mixed numbers 10_1/2 - 2' do
    expect(operate_fractions("10_1/2", "-", "2")).to eq("8_1/2")
  end

  it 'operate improper fractions 30/7 - 1/3' do
    expect(operate_fractions("30/7", "-", "1/3")).to eq("3_20/21")
  end
end
