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
		expect(array.takes_block_4{ |sum, val| sum += val }).to eq 10
	end





	it 'takes a block 5' do
		expect(array.takes_block_5{ |sum, val| sum + val }).to eq 34
	end 

end
