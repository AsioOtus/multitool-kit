import Foundation

@available(macOS 13.0, iOS 16.0, *)
extension Formatters.HTTPURLResponse {
    public struct Default: Formatters.HTTPURLResponse.PDefault {
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

        public func format (_ httpUrlResponse: HTTPURLResponse, body: Data?) -> String {
            var components = [String]()
            components.append(format(httpUrlResponse))
            components.append("")
            components.append(dataFormatter.format(body).ifNil("No body"))

            let string = components.joined(separator: "\n")
            return string
        }

        public func format (_ httpUrlResponse: HTTPURLResponse) -> String {
            var components = [String]()
            components.append(Formatters.HTTPURLResponse.SingleLine.default.format(httpUrlResponse))
            components.append("")

            components.append(
                dictionaryFormatter
                    .format(httpUrlResponse.allHeaderFields)
                    .ifEmpty("Header representation is empty")
            )

            components.append("")

            let string = components.joined(separator: "\n")
            return string
        }
    }
}

@available(macOS 13.0, iOS 16.0, *)
public extension Formatters.HTTPURLResponse.PDefault where Self == Formatters.HTTPURLResponse.Default {
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
