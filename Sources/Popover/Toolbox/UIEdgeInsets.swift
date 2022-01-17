import UIKit

prefix func - (inset: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(top: -inset.top, left: -inset.left, bottom: -inset.bottom, right: -inset.right)
}
