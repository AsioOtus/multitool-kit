import Foundation

extension DataFormatters {
	public struct OptionalComposite: OptionalDataFormatter {
		public static let `default` = Self(
			converters: [
				DataFormatters.JSON.default,
				DataFormatters.Text.default,
				DataFormatters.Base64.default
			]
		)
		
		public var converters: [OptionalDataFormatter]
		
		public init (converters: [OptionalDataFormatter]) {
			self.converters = converters
		}
		
		public func convert (_ data: Data) -> String? {
			for converter in converters {
				if let string = converter.convert(data) {
					return string
				}
			}
			
			return nil
		}
	}
}
