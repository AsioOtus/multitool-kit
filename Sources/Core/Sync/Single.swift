import Foundation

public class Single {
    private let lock = NSLock()

    public private(set) var isPerforming: Bool

    public init () { }

    public func perform (_ action: @escaping () -> Void) {
        lock.withLock {
            guard !isPerforming else { return }
            isPerforming = true
            action?()
            isPerformed = false
        }
    }
}
