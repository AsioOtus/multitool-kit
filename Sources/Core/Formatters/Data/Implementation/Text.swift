import Foundation

extension Formatters.Data {
    public struct Text: Formatters.Data.POptional {
        public static let `default` = Self()

        public var encoding: String.Encoding

        public init (encoding: String.Encoding = .utf8) {
            self.encoding = encoding
        }

        public func format (_ data: Data) -> String? {
            .init(data: data, encoding: encoding)
        }
    }
}

public extension Formatters.Data.POptional where Self == Formatters.Data.Text {
    static func text (encoding: String.Encoding) -> Self {
        .init(encoding: encoding)
    }

    static var text: Self {
        .default
    }
}
