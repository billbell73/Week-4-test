require 'array'

describe 'reopening of Array class' do

	let (:array) { [1,2,3,4] }

	it 'inject_1 returns self' do
		expect(array.inject_1).to eq [1,2,3,4]
	end

	it 'inject_plus does inject for plus - i.e. inject{ |sum, val| sum + val }' do
		expect(array.inject_plus).to eq 10
	end

	



	it 'try out times method with yield' do
		array = [12,34,560]
		expect(array.times(5) {|v| print "#{v} "}).to eq 0..4
	end

	
	it 'takes a block and prints nil four times over' do
		expect(array.takes_block{ |val| p val }).to eq [1,2,3,4]
	end

	

	it 'takes a block and prints 1234' do
		expect(array.takes_block_2{ |val| print val }).to eq [1,2,3,4]
	end



	it 'takes a block, does inject_plus but with logic in method' do
		expect(array.takes_block_3{ |sum, val| sum ** val }).to eq 10
	end






	it 'takes a block, logic in block' do
		expect(array.takes_block_4{ |sum, val| sum += val }).to eq 0
	end




	it 'takes a block 5' do
		expect(array.takes_block_5(3,4){ |sum, val| sum + val }).to eq 7
	end 

	

	it 'takes a block 6' do
		expect([2,3].takes_block_6{ |sum, val| sum + val }).to eq 5
	end

	it 'takes a block 7' do
		expect([3,4,6].takes_block_7{ |sum, val| sum + val }).to eq 13
	end

	it 'takes a block 7' do
		expect(array.takes_block_7{ |sum, val| sum + val }).to eq 10
	end


	it 'takes a block 8' do
		expect(array.takes_block_8{ |sum, val| sum + val }).to eq [1,2,3,4]
	end

	it 'takes a block 9' do
    expect(array.takes_block_9{ |sum, val| sum + val }).to eq 10
  end  

	it 'takes a block 5 with multiply' do
		expect(array.takes_block_5(3,4){ |sum, val| sum * val }).to eq 12
	end

	it 'takes an array of length 2 with multiply' do
		expect([5,6].takes_block_10{ |product, val| product * val }).to eq 150
	end

	it 'practices for loop and array' do
		expect(array.for_loop_practice).to eq [1,2,3,4]
	end

	it 'takes an array of length 2 with multiply' do
		expect([5,6].takes_block_11{ |product, val| product * val }).to eq 30
	end

	it 'can inject-multiply arrays' do
		expect(array.takes_block_11{ |product, val| product * val }).to eq 24
	end

	it 'can inject-add arrays' do
		expect(array.takes_block_11{ |product, val| product + val }).to eq 10
	end

	it 'can inject-interpolate strings' do
		expect(["h", "e", "l", "l", "o"].takes_block_11{ |memo, char| memo << char }).to eq "hello"
	end

	it 'can inject-interpolate strings' do
		expect(["h", "e", "l", "l", "o"].takes_block_11{ |memo, char| memo.concat char }).to eq "hello"
	end

	it 'can inject-add arrays with parameter' do
		expect(array.takes_block_13(10){ |product, val| product + val }).to eq 20
	end


	it "inject plus some other stuff - block 11" do
		expect([65,66,67].takes_block_11 {|memo, number| memo.to_s + number.chr}).to eq '65BC'
	end
	
	it "inject plus some other stuff - block 12" do
		expect([65,66,67].takes_block_12{|memo, number| memo + number.chr}).to eq 'ABC'
	end


	# it 'can build a hash - block 11' do
	# 	expect([[:first_name, 'Shane'], [:last_name, 'Harvie']].takes_block_11 { |result, element| result[element.first] = element.last; result }).to eq nil
	# end


	# it 'can build a hash - block 12' do
	# 	expect([[:first_name, 'Shane'], [:last_name, 'Harvie']].takes_block_12 { |result, element| result[element.first] = element.last; result }).to eq nil
	# end

	# it 'does hash' do
	# 	expect(hash = [[:first_name, 'Shane'], [:last_name, 'Harvie']].inject { |result, element|;result[element.first] = element.last; result }).to eq nil
	# end



end
























