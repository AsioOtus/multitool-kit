import Foundation

public protocol URLResponseFormatter {
	func convert (_ urlResponse: URLResponse, body: Data?) -> String
}
