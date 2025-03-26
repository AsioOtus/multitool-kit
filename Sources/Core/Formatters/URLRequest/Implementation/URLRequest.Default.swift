import Foundation

@available(macOS 13.0, iOS 16.0, *)
extension Formatters.URLRequest {
    public struct Default: Formatters.URLRequest.PDefault {
		public static let `default` = Self()
		
        public let dataFormatter: Formatters.Data.POptional
        public let dictionaryFormatter: Formatters.Dictionary.PDefault

		public init (
            dataFormatter: Formatters.Data.POptional = .compositeDefault,
            dictionaryFormatter: Formatters.Dictionary.PDefault = .multiline
		) {
			self.dataFormatter = dataFormatter
			self.dictionaryFormatter = dictionaryFormatter
		}
		
		public func format (_ urlRequest: URLRequest) -> String {
			var components = [String]()
            components.append(Formatters.URLRequest.SingleLine.default.format(urlRequest))
			components.append("")
			
			if let headersDictionary = urlRequest.allHTTPHeaderFields {
                components.append(
                    dictionaryFormatter
                        .format(headersDictionary)
                        .ifEmpty("Header representation is empty")
                )
			} else {
                components.append(noValue("No headers"))
			}
			
			components.append("")
			
			if let body = urlRequest.httpBody {
                components.append(
                    dataFormatter
                        .format(body)
                        .ifNil("Body representation is nil")
                        .ifEmpty("Body representation is empty")
                )
			} else {
				components.append(noValue("No body"))
			}
			
			let string = components.joined(separator: "\n")
			return string
		}
	}
}

@available(macOS 13.0, iOS 16.0, *)
public extension Formatters.URLRequest.PDefault where Self == Formatters.URLRequest.Default {
    static func `default` (
        dataFormatter: Formatters.Data.POptional = .compositeDefault,
        dictionaryFormatter: Formatters.Dictionary.PDefault = .multiline
    ) -> Self {
        .init(
            dataFormatter: dataFormatter,
            dictionaryFormatter: dictionaryFormatter
        )
    }

    static var `default`: Self {
        .default
    }
}
