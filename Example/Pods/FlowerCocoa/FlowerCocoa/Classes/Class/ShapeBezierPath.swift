import UIKit


public let BZP = BezierPathManager.default

open class BezierPathManager {
    
    static let `default` = BezierPathManager()
    
    public enum Flower_BezierPathMode {
        /// 自定义
        case line
        
        /// 矩形
        case rect(rect: CGRect)
        
        /// 圆角矩形 -> 可以向圆形过渡
        case roundedRect(rect: CGRect, radius: CGFloat)
        
        /// 椭圆矩形(内切圆): 如果是正方形矩形就是圆形
        case oval(rect: CGRect)
        
        /// 弧形
        //case acc
        
        /// 控制圆角
        case roundingCorners(rect: CGRect, radius: CGFloat, corners: UIRectCorner)
        
    }
    
    public func get(_ mode: Flower_BezierPathMode) -> UIBezierPath {
        switch mode {
        case .line:
            return UIBezierPath()
        case .rect(let rect):
            return UIBezierPath(rect: rect)
        case .roundedRect(let rect, let radius):
            return UIBezierPath(roundedRect: rect, cornerRadius: radius)
        case .oval(let rect):
            return UIBezierPath(ovalIn: rect)
        case .roundingCorners(let rect, let radius, let corners):
            return UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: 0))
        }
    }
    
}
