import Foundation

public protocol ThrowableDataFormatter: OptionalDataFormatter {
	func tryConvert (_ data: Data) throws -> String
}

public extension ThrowableDataFormatter {
	func convert (_ data: Data) -> String? {
		try? tryConvert(data)
	}
}
