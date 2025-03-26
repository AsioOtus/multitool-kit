import Foundation

extension Formatters.Data {
    public struct Base64: Formatters.Data.PDefault {
        public static let `default` = Self()

        public var options: Data.Base64EncodingOptions

        public init (options: Data.Base64EncodingOptions = []) {
            self.options = options
        }

        public func format (_ data: Data) -> String {
            data.base64EncodedString(options: options)
        }
    }
}

public extension Formatters.Data.PDefault where Self == Formatters.Data.Base64 {
    static func base64 (options: Data.Base64EncodingOptions) -> Self {
        .init(options: options)
    }

    static var base64: Self {
        .default
    }
}

public extension Formatters.Data.PThrowable where Self == Formatters.Data.Base64 {
    static func base64 (options: Data.Base64EncodingOptions) -> Self {
        .init(options: options)
    }

    static var base64: Self {
        .default
    }
}

public extension Formatters.Data.POptional where Self == Formatters.Data.Base64 {
    static func base64 (options: Data.Base64EncodingOptions) -> Self {
        .init(options: options)
    }

    static var base64: Self {
        .default
    }
}
