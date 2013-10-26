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

	def takes_block_5 three, four
		yield three,four
	end

	def takes_block_6 
		prev_val = 0
		accumulator = 0
		self.each do |val|
			accumulator = yield val, accumulator
			prev_val = val
		end
		accumulator
	end

# Works for addition but not multiply because of zero
	def takes_block_7 
		previous_value = 0
		return_value = 0
		self.each do |value|
			return_value = yield previous_value, value
			previous_value = return_value
		end
		return_value
	end

	def takes_block_8
		accumulator = 0
		self.each do |value|
			accumulator = yield accumulator, value
		end
	end

	def takes_block_9
		accumulator = 0
		self.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
	end

	def takes_block_10
		accumulator = self.first
		self.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
	end

	
	def takes_block_11
		first, *rest = self
		accumulator = first
		rest.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
	end

 	def takes_block_12	
 		first, *rest = self
		accumulator = yield '', first
		rest.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
	end

	def takes_block_13(initial)
		# first, *rest = self
		accumulator = initial
		self.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
	end




	def for_loop_practice
		for element in self do
  		puts element
  	end
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