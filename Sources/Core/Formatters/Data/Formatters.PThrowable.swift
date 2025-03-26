import Foundation

extension Formatters.Data {
    public protocol PThrowable: POptional {
        func tryFormat (_ data: Data) throws -> String
    }
}

public extension Formatters.Data.PThrowable {
    func format (_ data: Data) -> String? {
        try? tryFormat(data)
    }
}
