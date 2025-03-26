import Foundation

public class Once {
    private let lock = NSLock()

    public private(set) var isPerformed: Bool

    public init () { }

    public func perform (_ action: @escaping () -> Void) {
        lock.withLock {
            guard !isPerformed else { return }
            action?()
            isPerformed = true
        }
    }
}
