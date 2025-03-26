import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLRequestFormatters {
	public struct ShortSingleLine: URLRequestFormatter {
		public init () { }
		
		public func convert (_ urlRequest: URLRequest) -> String {
			let string = "\(urlRequest.httpMethod ?? "[No method]") – \(urlRequest.url?.absoluteString ?? "[No URL]")"
			return string
		}
	}
}
