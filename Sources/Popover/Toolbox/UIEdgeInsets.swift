import UIKit

func + (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top + right.top, left: left.left + right.left, bottom: left.bottom + right.bottom, right: left.right + right.right)
}

func - (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top - right.top, left: left.left - right.left, bottom: left.bottom - right.bottom, right: left.right - right.right)
}

func * (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top * right.top, left: left.left * right.left, bottom: left.bottom * right.bottom, right: left.right * right.right)
}

func / (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top / right.top, left: left.left / right.left, bottom: left.bottom / right.bottom, right: left.right / right.right)
}

prefix func - (inset: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(top: -inset.top, left: -inset.left, bottom: -inset.bottom, right: -inset.right)
}

// MARK: - UIEdgeInsets CGFloat operations

func + (left: UIEdgeInsets, right: CGFloat) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top + right, left: left.left + right, bottom: left.bottom + right, right: left.right + right)
}

func - (left: UIEdgeInsets, right: CGFloat) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top - right, left: left.left - right, bottom: left.bottom - right, right: left.right - right)
}

func * (left: UIEdgeInsets, right: CGFloat) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top * right, left: left.left * right, bottom: left.bottom * right, right: left.right * right)
}

func / (left: UIEdgeInsets, right: CGFloat) -> UIEdgeInsets {
    UIEdgeInsets(top: left.top / right, left: left.left / right, bottom: left.bottom / right, right: left.right / right)
}
