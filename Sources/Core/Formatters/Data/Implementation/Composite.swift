import Foundation

extension Formatters.Data {
    public struct Composite: Formatters.Data.PDefault {
        public static let `default` = Self(
            formatters: [
                .json,
                .text,
            ],
            default: .base64
        )

        public var formatters: [Formatters.Data.POptional]
        public var `default`: Formatters.Data.PDefault

        public init (formatters: [Formatters.Data.POptional], default: Formatters.Data.PDefault) {
            self.formatters = formatters
            self.default = `default`
        }

        public func format (_ data: Data) -> String {
            for converter in formatters {
                if let string = converter.format(data) {
                    return string
                }
            }

            let string = `default`.format(data)
            return string
        }
    }
}

public extension Formatters.Data.PDefault where Self == Formatters.Data.Composite {
    static func composite (formatters: [Formatters.Data.POptional], default: Formatters.Data.PDefault) -> Self {
        .init(formatters: formatters, default: `default`)
    }
}

public extension Formatters.Data.PThrowable where Self == Formatters.Data.Composite {
    static func composite (formatters: [Formatters.Data.POptional], default: Formatters.Data.PDefault) -> Self {
        .init(formatters: formatters, default: `default`)
    }
}

public extension Formatters.Data.POptional where Self == Formatters.Data.Composite {
    static func composite (formatters: [Formatters.Data.POptional], default: Formatters.Data.PDefault) -> Self {
        .init(formatters: formatters, default: `default`)
    }
}

public extension Formatters.Data.PDefault where Self == Formatters.Data.Composite {
    static var compositeDefault: Self {
        .default
    }
}

public extension Formatters.Data.PThrowable where Self == Formatters.Data.Composite {
    static var compositeDefault: Self {
        .default
    }
}

public extension Formatters.Data.POptional where Self == Formatters.Data.Composite {
    static var compositeDefault: Self {
        .default
    }
}
