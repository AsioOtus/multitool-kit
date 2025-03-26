import Foundation

extension DataFormatters {
	public struct Composite: DataFormatter {
		public static let `default` = Self(
			converters: [
				DataFormatters.JSON.default,
				DataFormatters.Text.default
			],
			lastResortConverter: DataFormatters.Base64.default
		)
		
		public var converters: [OptionalDataFormatter]
		public var lastResortConverter: DataFormatter
		
		public init (converters: [OptionalDataFormatter], lastResortConverter: DataFormatter) {
			self.converters = converters
			self.lastResortConverter = lastResortConverter
		}
		
		public func convert (_ data: Data) -> String {
			for converter in converters {
				if let string = converter.convert(data) {
					return string
				}
			}
			
			let string = lastResortConverter.convert(data)
			return string
		}
	}
}
