import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLResponseFormatters {
	public struct ShortSingleLine: URLResponseFormatter {
		public init () { }
		
		public func convert (_ urlResponse: URLResponse, body: Data? = nil) -> String {
			urlResponse.url?.absoluteString ?? "[No URL]"
		}
	}
}

public extension URLResponseFormatter where Self == URLResponseFormatters.ShortSingleLine {
	static func shortSingleLine () -> Self {
		.init()
	}
}
