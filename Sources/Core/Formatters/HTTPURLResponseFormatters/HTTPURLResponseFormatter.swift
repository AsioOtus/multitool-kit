import Foundation

public protocol HTTPURLResponseFormatter {
    func convert (_ httpUrlResponse: HTTPURLResponse, body: Data?) -> String
}
