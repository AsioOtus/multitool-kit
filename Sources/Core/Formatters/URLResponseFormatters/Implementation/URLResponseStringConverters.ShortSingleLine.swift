import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLResponseStringConverters {
	public struct ShortSingleLine: URLResponseFormatter {
		public init () { }
		
		public func convert (_ urlResponse: URLResponse, body: Data? = nil) -> String {
			urlResponse.url?.absoluteString ?? "[No URL]"
		}
	}
}
