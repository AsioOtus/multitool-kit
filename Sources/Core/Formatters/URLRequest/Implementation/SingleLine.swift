import Foundation

@available(macOS 13.0, iOS 16.0, *)
extension Formatters.URLRequest {
    public struct SingleLine: Formatters.URLRequest.PDefault {
        public static let `default` = Self()

        public let urlFormatStyle: URL.FormatStyle

        public init (urlFormatStyle: URL.FormatStyle = .init()) {
            self.urlFormatStyle = urlFormatStyle
        }

        public func format (_ urlRequest: URLRequest) -> String {
            "\(urlRequest.httpMethod ?? noValue("No method")) – \(urlRequest.url?.formatted(urlFormatStyle) ?? noValue("No URL"))"
        }
    }
}

@available(macOS 13.0, iOS 16.0, *)
public extension Formatters.URLRequest.PDefault where Self == Formatters.URLRequest.SingleLine {
    static func singleLine (urlFormatStyle: URL.FormatStyle) -> Self {
        .init(urlFormatStyle: urlFormatStyle)
    }

    static var singleLine: Self {
        .init()
    }
}
