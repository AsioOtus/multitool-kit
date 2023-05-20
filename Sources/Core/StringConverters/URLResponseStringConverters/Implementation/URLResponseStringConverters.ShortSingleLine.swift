import Foundation

extension URLResponseStringConverters {
	public struct ShortSingleLine: URLResponseStringConverter {
		public init () { }
		
		public func convert (_ urlResponse: URLResponse, body: Data? = nil) -> String {
			urlResponse.url?.absoluteString ?? "[No URL]"
		}
	}
}
