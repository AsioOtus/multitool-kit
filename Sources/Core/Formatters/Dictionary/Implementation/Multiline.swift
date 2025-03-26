extension Formatters.Dictionary.Multiline {
    public struct Options {
        public static let `default` = Self()
        public static var bracketed: Self { .bracketed() }
        public static func bracketed (padding: String = " ", paddingSize: Int = 4) -> Self {
            .init(brackets: true, padding: padding, paddingSize: paddingSize)
        }

        public let brackets: Bool
        public let padding: String
        public let paddingSize: Int

        public init (
            brackets: Bool = false,
            padding: String = " ",
            paddingSize: Int = 0
        ) {
            self.brackets = brackets
            self.padding = padding
            self.paddingSize = paddingSize
        }
    }
}

extension Formatters.Dictionary {
    public struct Multiline: PDefault {
        public static let `default` = Self()

        public let options: Options

        public init (options: Options = .default) {
            self.options = options
        }

        public func format (_ dictionary: Dictionary<AnyHashable, Any>) -> String {
            let padding = (0..<options.paddingSize)
                .map { _ in options.padding }
                .joined()

            var string = dictionary
                .map { "\($0.key): \($0.value)" }
                .map { padding + $0 }
                .joined(separator: "\n")

            if options.brackets {
                string = """
                [
                \(string)
                ]
                """
            }

            return string
        }
    }
}

public extension Formatters.Dictionary.PDefault where Self == Formatters.Dictionary.Multiline {
    static func multiline (options: Formatters.Dictionary.Multiline.Options) -> Self {
        .init(options: options)
    }

    static var multiline: Self {
        .default
    }
}
