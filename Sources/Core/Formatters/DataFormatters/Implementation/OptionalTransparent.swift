import Foundation

extension DataFormatters {
	public struct OptionalTransparent: OptionalDataFormatter {
		public static let `default` = Self()
		
		public init () { }
		
		public func convert (_ data: Data) -> String? { nil }
	}
}
