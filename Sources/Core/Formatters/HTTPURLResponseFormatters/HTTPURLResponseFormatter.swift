import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol HTTPURLResponseFormatter {
    func convert (_ httpUrlResponse: HTTPURLResponse, body: Data?) -> String
}
