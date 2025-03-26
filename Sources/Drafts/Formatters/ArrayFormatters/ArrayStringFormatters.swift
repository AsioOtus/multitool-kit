import Foundation

public protocol ArrayStringFormatters {
	func convert <T> (_ dictionary: Array<T>) -> String
}
