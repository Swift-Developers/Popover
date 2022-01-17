import UIKit

extension UIView {
    
    private struct AssociateKey {
        static var shadowColor: Void?
    }
    
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    var zPosition: CGFloat {
        get { layer.zPosition }
        set { layer.zPosition = newValue }
    }
    
    var shadowOpacity: CGFloat {
        get { CGFloat(layer.shadowOpacity) }
        set { layer.shadowOpacity = Float(newValue) }
    }
    
    var shadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    var shadowColor: UIColor? {
        get {
            if #available(iOS 13.0, *) {
                return objc_getAssociatedObject(self, &AssociateKey.shadowColor) as? UIColor
            } else {
                guard let color = layer.shadowColor else { return nil }
                return UIColor(cgColor: color)
            }
        }
        set {
            if #available(iOS 13.0, *) {
                _ = UIView.swizzleTraitCollection
                objc_setAssociatedObject(self, &AssociateKey.shadowColor, newValue, .OBJC_ASSOCIATION_RETAIN)
                layer.shadowColor = shadowColor?.resolvedColor(with: traitCollection).cgColor
            } else {
                layer.shadowColor = newValue?.cgColor
            }
        }
    }
    
    var frameWithoutTransform: CGRect {
        get {
            CGRect(center: center, size: bounds.size)
        }
        set {
            bounds.size = newValue.size
            center = newValue.offsetBy(
                dx: bounds.width * (layer.anchorPoint.x - 0.5),
                dy: bounds.height * (layer.anchorPoint.y - 0.5)
            ).center
        }
    }
    
    @available(iOS 13.0, *)
    private static let swizzleTraitCollection: Void = {
        guard let originalMethod = class_getInstanceMethod(UIView.self, #selector(traitCollectionDidChange(_:))),
              let swizzledMethod = class_getInstanceMethod(UIView.self, #selector(swizzled_traitCollectionDidChange(_:)))
        else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }()
    
    @available(iOS 13.0, *)
    @objc
    func swizzled_traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        swizzled_traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.hasDifferentColorAppearance(comparedTo: traitCollection) != false {
            if let shadowColor = shadowColor {
                layer.shadowColor = shadowColor.resolvedColor(with: traitCollection).cgColor
            }
        }
    }
}
