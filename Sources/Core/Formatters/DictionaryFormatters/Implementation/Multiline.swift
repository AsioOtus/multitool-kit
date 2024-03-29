import Foundation

extension DictionaryFormatters {
	public struct Multiline: DictionaryFormatter {
		public static let `default` = Self()
		
		public init () { }
		
		public func convert (_ dictionary: Dictionary<AnyHashable, Any>) -> String {
			dictionary.map{ "\($0.key): \($0.value)" }.joined(separator: "\n")
		}
	}
}
