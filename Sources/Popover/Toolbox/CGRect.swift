import CoreGraphics

extension CGRect {
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
    
    var bounds: CGRect {
        CGRect(origin: .zero, size: size)
    }
    
    var transposed: CGRect {
        CGRect(origin: origin.transposed, size: size.transposed)
    }
    
    /// force positive width and height
    /// (0, 0, -100, -100) -> (-100, -100, 100, 100)
    var normalized: CGRect {
        CGRect(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
    
    var topLeft: CGPoint {
        CGPoint(x: minX, y: minY)
    }
    
    var topRight: CGPoint {
        CGPoint(x: maxX, y: minY)
    }
    
    var bottomLeft: CGPoint {
        CGPoint(x: minX, y: maxY)
    }
    
    var bottomRight: CGPoint {
        CGPoint(x: maxX, y: maxY)
    }
    
    init(center: CGPoint, size: CGSize) {
        self.init(origin: center - size / 2, size: size)
    }
    
    func rounded(_ scale: CGFloat = 1) -> CGRect {
        CGRect(origin: origin.rounded(scale), size: size.rounded(scale))
    }
}

extension CGRect: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(origin)
        hasher.combine(size)
    }
}

// MARK: - CGRect CGFloat operations

func + (left: CGRect, right: CGFloat) -> CGRect {
    CGRect(origin: left.origin + right, size: left.size + right)
}

func - (left: CGRect, right: CGFloat) -> CGRect {
    CGRect(origin: left.origin - right, size: left.size - right)
}

func * (left: CGRect, right: CGFloat) -> CGRect {
    CGRect(origin: left.origin * right, size: left.size * right)
}

func / (left: CGRect, right: CGFloat) -> CGRect {
    CGRect(origin: left.origin / right, size: left.size / right)
}

// MARK: - CGRect CGPoint operations

func + (left: CGRect, right: CGPoint) -> CGRect {
    CGRect(origin: left.origin + right, size: left.size)
}

func - (left: CGRect, right: CGPoint) -> CGRect {
    CGRect(origin: left.origin - right, size: left.size)
}

// MARK: - CGRect CGSize operations

func + (left: CGRect, right: CGSize) -> CGRect {
    CGRect(origin: left.origin, size: left.size + right)
}

func - (left: CGRect, right: CGSize) -> CGRect {
    CGRect(origin: left.origin, size: left.size + right)
}
