require 'array'

describe 'reopening of Array class' do

	let (:array) { [1,2,3,4] }

	it 'can inject-add arrays' do
		expect(array.new_inject{ |sum, val| sum + val }).to eq 10
	end

	it 'takes an array of length 2 with multiply' do
		expect([5,6].new_inject{ |product, val| product * val }).to eq 30
	end

	it 'can inject-multiply arrays' do
		expect(array.new_inject{ |product, val| product * val }).to eq 24
	end

	it 'can inject-add arrays' do
		expect(array.new_inject{ |product, val| product + val }).to eq 10
	end

	it 'can inject-interpolate strings' do
		expect(["h", "e", "l", "l", "o"].new_inject{ |memo, char| memo << char }).to eq "hello"
	end

	it 'can inject-interpolate strings' do
		expect(["h", "e", "l", "l", "o"].new_inject{ |memo, char| memo.concat char }).to eq "hello"
	end

	it 'can inject-add arrays with parameter' do
		expect(array.new_inject_with_arg(10){ |product, val| product + val }).to eq 20
	end

	it "inject with parameter extends functionality" do
		expect([65,66,67].new_inject_with_arg(''){|memo, number| memo + number.chr}).to eq 'ABC'
	end

	xit 'can build a hash' do
		expect([[:first_name, 'Shane'], [:last_name, 'Harvie']].new_inject { |result, element| result[element.first] = element.last; result }).to eq nil
	end

end
























