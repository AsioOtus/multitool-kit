import Foundation

extension Formatters.URLRequest {
    public struct Short: Formatters.URLRequest.PDefault {
        public static let `default` = Self()

        public init () { }

        public func format (_ urlRequest: URLRequest) -> String {
            "\(urlRequest.httpMethod ?? noValue("No method")) – \(urlRequest.url?.absoluteString ?? noValue("No URL"))"
        }
    }
}

public extension Formatters.URLRequest.PDefault where Self == Formatters.URLRequest.Short {
    static var short: Self {
        .init()
    }
}
