import Foundation

extension Comparable {
    func clamp(_ minValue: Self, _ maxValue: Self) -> Self {
        self < minValue ? minValue : (self > maxValue ? maxValue : self)
    }
}
