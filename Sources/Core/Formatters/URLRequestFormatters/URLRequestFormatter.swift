import Foundation

public protocol URLRequestFormatter {
	func convert (_ urlRequest: URLRequest) -> String
}
