
class Polystring:
	
	identifier = "en_US"
	
	def __init__(self, raw):
		self.raw = raw
	
	def __str__(self):
		return self.locale
	
	def __repr__(self):
		return self.locale
	
	@property
	def locale(self):
		return self.to(Polystring.identifier)
	
	def to(self, target):
		text = self.raw
		while True :
			separator = text.find('\\')
			if separator < 0 :
				return text
			
			end = text.find('\0')
			if text[:separator] == target[:separator] :
				return text[separator + 1: end]
			
			text = text[end + 1:]
			while text[0] == ' ' :
				text = text[1:]
