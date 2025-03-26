import Foundation

extension Formatters.URLRequest {
    public protocol PDefault {
        func format (_ urlRequest: URLRequest) -> String
    }
}
