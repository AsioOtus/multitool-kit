import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol URLRequestFormatter {
	func convert (_ urlRequest: URLRequest) -> String
}
