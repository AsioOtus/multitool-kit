import Foundation

extension Formatters.Data {
    public struct JSON: Formatters.Data.PThrowable {
        public static let `default` = Self()

        private let options: JSONSerialization.WritingOptions

        public init (options: JSONSerialization.WritingOptions = [.prettyPrinted]) {
            self.options = options
        }

        public func tryFormat (_ data: Data) throws -> String {
            let object = try JSONSerialization.jsonObject(with: data, options: [])
            let data = try JSONSerialization.data(withJSONObject: object, options: options)

            guard let string = String(data: data, encoding: .utf8)
            else { throw Error.init(description: ".utf8 String decoding failure") }

            return string
        }
    }
}

public extension Formatters.Data.PThrowable where Self == Formatters.Data.JSON {
    static func json (options: JSONSerialization.WritingOptions) -> Self {
        .init(options: options)
    }

    static var json: Self {
        .default
    }
}

public extension Formatters.Data.POptional where Self == Formatters.Data.JSON {
    static func json (options: JSONSerialization.WritingOptions) -> Self {
        .init(options: options)
    }

    static var json: Self {
        .default
    }
}
