/*
Copyright (c) 2019 Aurélien Bouilland

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import Foundation

public struct Polystring {
	
	public static var identifier = Locale.current.identifier
	
	public let raw : String
	
	public init(_ raw: String) {
		self.raw = raw
	}
	
	public var locale: String {
		return self.to(Polystring.identifier)
	}
	
	public func to(_ target: String) -> String {
		var text = raw[raw.startIndex...]
		while let separator = text.firstIndex(of: "\\") {
			var end = text.firstIndex(of: "\0") ?? text.endIndex
			let identifier = text.prefix(upTo: separator)
			if identifier == target.prefix(identifier.count) {
				return String(text[text.index(after: separator)..<end])
			} else {
				repeat {
					text = text[text.index(after: end)...]
					end = text.startIndex
				} while text.prefix(1) == " "
			}
		}
		return String(text)
	}
	
}

extension Polystring: Decodable {
	public init(from decoder: Decoder) throws {
		self.raw = try String.init(from: decoder)
	}
}

extension Polystring: Encodable {
	public func encode(to encoder: Encoder) throws {
		try self.raw.encode(to: encoder)
	}
}

extension Polystring: CustomStringConvertible {
	public var description: String {
		return self.locale
	}
}
