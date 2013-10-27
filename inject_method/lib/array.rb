class Array

	def new_inject
		first, *rest = self
		accumulator = first
		rest.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
	end

 	def new_inject_with_arg(initial)
		accumulator = initial
		self.each do |value|
			accumulator = yield accumulator, value
		end
		accumulator
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