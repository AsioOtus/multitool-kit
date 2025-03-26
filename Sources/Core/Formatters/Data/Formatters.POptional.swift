import Foundation

extension Formatters.Data {
    public protocol POptional {
        func format (_ data: Data) -> String?
    }
}
