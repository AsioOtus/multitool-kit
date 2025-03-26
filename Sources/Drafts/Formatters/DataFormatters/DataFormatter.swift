import Foundation

public protocol DataFormatter: ThrowableDataFormatter {
    func convert (_ data: Data) -> String
}

public extension DataFormatter {	
	func tryConvert (_ data: Data) throws -> String {
		convert(data)
	}
}
