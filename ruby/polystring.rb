
class Polystring
	
	@@identifier = "en_US"
	
	def Polystring.identifier= (identifier)
		@@identifier = identifier
	end
	
	def Polystring.identifier
		return @@identifier
	end
	
	def initialize(raw)
		@raw = raw
	end
	
	def to_s
		locale
	end
	
	def raw
		@raw
	end
	
	def locale
		to(@@identifier)
	end
	
	def to(target)
		text = @raw
		loop do
			separator = text.index("\\")
			return text unless separator
			
			last = text.index("\0")
			return text[separator + 1, last - separator] if text[0, separator] == target[0, separator]
			
			text = text[last + 1, text.length - last - 1]
			while text[0] == " "
				text = text[1, text.length - 1]
			end
		end
	end
	
end
