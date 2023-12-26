import Foundation

public protocol OptionalDataFormatter {
    func convert (_ data: Data) -> String?
}
