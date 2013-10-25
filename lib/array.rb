class Array

	



	def inject_1
		self
	end

	def inject_plus
		sum = 0
		self.each do |val| 
			sum += val
		end
		sum
	end

	def times(n)
  	for i in 0..n-1 do
    	yield(i) # the yield keyword executes the block
  	end
	end

	def takes_block
		self.each do |val| 
			yield
		end
	end

	def takes_block_2
		self.each do |val| 
			yield val
		end
	end

	def takes_block_3
		accumulator = 0
		self.each do |val| 
			accumulator += val
			yield accumulator, val
		end
		accumulator
	end

	def takes_block_4
		accumulator = 0
		self.each do |val| 
			yield accumulator, val
			puts "accum: #{accumulator},  val: #{val}"
		end
		accumulator
	end

	def takes_block_5

	end





	# inject_3(2){ |v| print "#{v} " }


	# def inject_3(&block)
	# 	accumulator = 0
	# 	self.each do |val| 
	# 		yield accumulator
	# 	end
	# 	accumulator
	# end
	

end