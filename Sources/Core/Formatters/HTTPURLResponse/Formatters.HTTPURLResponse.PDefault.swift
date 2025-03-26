import Foundation

extension Formatters.HTTPURLResponse {
    public protocol PDefault {
        func format (_ httpUrlResponse: HTTPURLResponse) -> String
        func format (_ httpUrlResponse: HTTPURLResponse, body: Data?) -> String
    }
}
