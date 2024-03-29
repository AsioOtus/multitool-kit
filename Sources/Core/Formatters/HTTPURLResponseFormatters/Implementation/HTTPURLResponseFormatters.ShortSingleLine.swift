import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension HTTPURLResponseFormatters {
	public struct ShortSingleLine: HTTPURLResponseFormatter {
		public init () { }
		
		public func convert (_ httpUrlResponse: HTTPURLResponse, body: Data?) -> String {
			let string = "\(httpUrlResponse.url?.absoluteString ?? "[No URL]") – \(httpUrlResponse.statusCode)"
			return string
		}
	}
}
