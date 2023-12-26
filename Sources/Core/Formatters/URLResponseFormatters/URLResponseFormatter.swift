import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol URLResponseFormatter {
	func convert (_ urlResponse: URLResponse, body: Data?) -> String
}
