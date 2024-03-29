import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLRequestFormatters {
	public struct Default: URLRequestFormatter {
		public static let `default` = Self()
		
		public let dataStringConverter: OptionalDataFormatter
		public let dictionaryStringConverter: DictionaryFormatter
		
		public init (
			dataStringConverter: OptionalDataFormatter = DataFormatters.OptionalComposite.default,
			dictionaryStringConverter: DictionaryFormatter = DictionaryFormatters.Multiline.default
		) {
			self.dataStringConverter = dataStringConverter
			self.dictionaryStringConverter = dictionaryStringConverter
		}
		
		public func convert (_ urlRequest: URLRequest) -> String {
			var components = [String]()
			
			let firstLine = ShortSingleLine().convert(urlRequest)
			components.append(firstLine)
			
			components.append("")
			
			if let headersDictionary = urlRequest.allHTTPHeaderFields {
				let headers = dictionaryStringConverter.convert(headersDictionary)
				
				if !headers.isEmpty {
					components.append(headers)
				} else {
					components.append("[Header representation is empty]")
				}
			} else {
				components.append("[No headers]")
			}
			
			components.append("")
			
			if let body = urlRequest.httpBody {
				if let bodyString = dataStringConverter.convert(body), !bodyString.isEmpty {
					components.append(bodyString)
				} else {
					components.append("[Body representation is empty]")
				}
			} else {
				components.append("[No body]")
			}
			
			let string = components.joined(separator: "\n")
			return string
		}
	}
}
