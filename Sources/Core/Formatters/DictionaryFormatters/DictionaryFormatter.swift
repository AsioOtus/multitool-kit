import Foundation

public protocol DictionaryFormatter {
    func convert (_ dictionary: Dictionary<AnyHashable, Any>) -> String
}
