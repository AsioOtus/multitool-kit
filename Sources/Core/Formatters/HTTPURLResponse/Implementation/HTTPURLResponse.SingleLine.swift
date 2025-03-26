import Foundation

extension Formatters.HTTPURLResponse {
    public struct SingleLine: Formatters.HTTPURLResponse.PDefault {
        public static let `default` = Self()

        public init () { }

        public func format (_ httpUrlResponse: HTTPURLResponse) -> String {
            format(httpUrlResponse, body: .init())
        }

        public func format (_ httpUrlResponse: HTTPURLResponse, body: Data) -> String {
            let url = (httpUrlResponse.url?.absoluteString ?? "").ifEmpty("No URL")
            return url + " – " + httpUrlResponse.statusCode.description
        }
    }
}

@available(macOS 13.0, iOS 16.0, *)
public extension Formatters.HTTPURLResponse.PDefault where Self == Formatters.HTTPURLResponse.SingleLine {
   static var singleLine: Self {
        .default
    }
}
