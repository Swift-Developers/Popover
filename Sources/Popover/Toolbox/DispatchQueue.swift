import Foundation

extension DispatchQueue {
    func delay(_ delay: TimeInterval = 0, execute: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: execute)
    }
}

/// Delay on main queue.
func delay(_ delay: TimeInterval = 0, execute: @escaping () -> Void) {
    DispatchQueue.main.delay(delay, execute: execute)
}

