module IAS; end

class IAS::HelloRepoLayout
	# This is an instance method
	def hello
		puts "Hello, IAS Repo!\n"
	end
	
	# This is a class method
	def self.simple_return
		return 1
	end
end
