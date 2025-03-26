import Foundation

extension Formatters.Data {
    public protocol PDefault: PThrowable {
        func format (_ data: Data) -> String
    }
}

public extension Formatters.Data.PDefault {
    func tryFormat (_ data: Data) throws -> String {
        format(data)
    }
}
