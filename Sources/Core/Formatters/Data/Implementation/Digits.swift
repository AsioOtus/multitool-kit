import Foundation

extension Formatters.Data.Digits {
    public struct Options {
        public static let `default` = Self()

        public let radix: Radix
        public var prefixed: Bool
        public var separator: String

        public init (
            radix: Radix = .hex,
            prefixed: Bool = false,
            separator: String = " "
        ) {
            self.radix = radix
            self.prefixed = prefixed
            self.separator = separator
        }
    }
}

extension Formatters.Data.Digits.Options {
    public enum Radix: Int {
        case bin = 2
        case oct = 8
        case dec = 10
        case hex = 16

        public var prefix: String {
            switch self {
            case .bin: "0b"
            case .oct: "0o"
            case .dec: "0d"
            case .hex: "0x"
            }
        }
    }
}

extension Formatters.Data {
    public struct Digits: Formatters.Data.PDefault {
        public static let `default` = Self()

        public let options: Options

        public init (options: Options = .default) {
            self.options = options
        }

        public func format (_ data: Data) -> String {
            data
                .map { .init($0, radix: options.radix.rawValue) }
                .map { options.prefixed ? options.radix.prefix : "" + $0 }
                .joined(separator: options.separator)
        }
    }
}

public extension Formatters.Data.PDefault where Self == Formatters.Data.Digits {
    static func digits (options: Formatters.Data.Digits.Options) -> Self {
        .init(options: options)
    }

    static var digits: Self {
        .default
    }
}

public extension Formatters.Data.PThrowable where Self == Formatters.Data.Digits {
    static func digits (options: Formatters.Data.Digits.Options) -> Self {
        .init(options: options)
    }

    static var digits: Self {
        .default
    }
}

public extension Formatters.Data.POptional where Self == Formatters.Data.Digits {
    static func digits (options: Formatters.Data.Digits.Options) -> Self {
        .init(options: options)
    }

    static var digits: Self {
        .default
    }
}

