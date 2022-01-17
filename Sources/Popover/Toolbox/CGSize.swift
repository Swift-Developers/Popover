import CoreGraphics

extension CGSize {
    var transposed: CGSize {
        CGSize(width: height, height: width)
    }
    
    func transform(_ trans: CGAffineTransform) -> CGSize {
        applying(trans)
    }
    
    func size(fill: CGSize) -> CGSize {
        self * max(fill.width / width, fill.height / height)
    }
    
    func size(fillIfSmaller fill: CGSize) -> CGSize {
        self * max(1, max(fill.width / width, fill.height / height))
    }
    
    func size(fit: CGSize) -> CGSize {
        self * min(fit.width / width, fit.height / height)
    }
    
    func size(fitIfBigger fit: CGSize) -> CGSize {
        self * min(1, min(fit.width / width, fit.height / height))
    }
    
    func rounded(_ scale: CGFloat = 1) -> CGSize {
        CGSize(width: (width * scale).rounded(.up) / scale, height: (height * scale).rounded(.up) / scale)
    }
}

extension CGSize: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}

func abs(_ left: CGSize) -> CGSize {
    CGSize(width: abs(left.width), height: abs(left.height))
}

func min(_ left: CGSize, _ right: CGSize) -> CGSize {
    CGSize(width: min(left.width, right.width), height: min(left.height, right.height))
}

// MARK: - CGSize operations

func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width, height: left.height + right.height)
}

func - (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width - right.width, height: left.height - right.height)
}

func * (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width * right.width, height: left.height * right.height)
}

func / (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width / right.width, height: left.height / right.height)
}

prefix func - (size: CGSize) -> CGSize {
    CGSize.zero - size
}

func += (left: inout CGSize, right: CGSize) {
    left.width += right.width
    left.height += right.height
}

// MARK: - CGSize CGFloat operations

func + (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(width: left.width + right, height: left.height + right)
}

func - (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(width: left.width - right, height: left.height - right)
}

func * (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(width: left.width * right, height: left.height * right)
}

func / (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(width: left.width / right, height: left.height / right)
}

func + (left: CGFloat, right: CGSize) -> CGSize {
    CGSize(width: left + right.height, height: left + right.height)
}

func - (left: CGFloat, right: CGSize) -> CGSize {
    CGSize(width: left - right.height, height: left - right.height)
}

func * (left: CGFloat, right: CGSize) -> CGSize {
    CGSize(width: left * right.height, height: left * right.height)
}

func / (left: CGFloat, right: CGSize) -> CGSize {
    CGSize(width: left / right.height, height: left / right.height)
}

// MARK: - CGSize CGPoint operations

func + (left: CGSize, right: CGPoint) -> CGSize {
    CGSize(width: left.width + right.x, height: left.height + right.y)
}

func - (left: CGSize, right: CGPoint) -> CGSize {
    CGSize(width: left.width - right.x, height: left.height - right.y)
}

func * (left: CGSize, right: CGPoint) -> CGSize {
    CGSize(width: left.width * right.x, height: left.height * right.y)
}

func / (left: CGSize, right: CGPoint) -> CGSize {
    CGSize(width: left.width / right.x, height: left.height / right.y)
}


import UIKit

extension CGSize {
    
    func inset(by insets: UIEdgeInsets) -> CGSize {
        CGSize(width: width - insets.left - insets.right, height: height - insets.top - insets.bottom)
    }
}
