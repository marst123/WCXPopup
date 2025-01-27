import UIKit
import QuartzCore
import Accelerate


//MARK: - CAGradientLayer属性扩展

public extension Link where Base: CAGradientLayer {
    
    /// 大小
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Link {
        self.base.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return self
    }
    
    /// 颜色Array
    @discardableResult
    func colors(_ colors: [CGColor]?) -> Link {
        self.base.colors = colors
        return self
    }
    
    /// 位置Array
    /// - Parameter locations: 0~1的区间
    @discardableResult
    func locations(_ locations: [NSNumber]?) -> Link {
        self.base.locations = locations
        return self
    }
    
    /// point模式
    @discardableResult
    func pointMode(_ mode: CAGradientLayerPointDirection) -> Link {
        self.base.startPoint = mode.point.0
        self.base.endPoint = mode.point.1
        return self
    }
}


public enum CAGradientLayerPointDirection {
    
    case horizontal         // 水平方向
    
    case vertical           // 垂直方向
    
    case leadingVertical    // 左上到右下方向
    
    case trailingVertical   // 右上到左下方向
    
    case custom(CGPoint, CGPoint)
    
    /// (startPoint, endPoint)
    public var point: (CGPoint, CGPoint) {
        switch self {
        case .horizontal:
            return (CGPoint(x: 0.0, y: 0.5),
                    CGPoint(x: 1.0, y: 0.5))
        case .vertical:// 默认
            return (CGPoint(x: 0.5, y: 0.0),
                    CGPoint(x: 0.5, y: 1.0))
        case .leadingVertical:
            return (CGPoint(x: 0.0, y: 0.0),
                    CGPoint(x: 1.0, y: 1.0))
        case .trailingVertical:
            return (CGPoint(x: 1.0, y: 0.0),
                    CGPoint(x: 0.0, y: 1.0))
        case .custom(let startPoint, let endPoint):
            return (startPoint, endPoint)
        }
    }
    
}

public extension Link where Base: UIView {
    
    /// 渐变绘制
    /// - Parameters:
    ///   - mode: point模式
    ///   - colors: 颜色组
    ///   - locations: 位置组
    ///   - size: 划分大小
    ///   - insert: 是否插入 默认false
    @discardableResult
    func configGradientLayer(mode: CAGradientLayerPointDirection, colors: [CGColor]?, locations: [NSNumber]?, size: CGSize, insert: Bool = false) -> Link {
        let layer = CAGradientLayer().link
            .pointMode(mode)
            .colors(colors)
            .locations(locations)
            .size(width: size.width, height: size.height)
            .base
        if insert == true {// 针对以此视图作为父视图,子控件无法显示,需要用插入
            self.base.link.insertLayer(layer)
        }else {
            self.base.link.toLayer(layer)

        }
        return self
    }
}

public extension Link where Base: GradientLayerLabel {

    /// 渐变绘制 (针对UILabel吞掉渐变问题)
    /// - Parameters:
    ///   - mode: point模式
    ///   - colors: 颜色组
    ///   - locations: 位置组
    @discardableResult
    func configGradientLayer(mode: CAGradientLayerPointDirection, colors: [CGColor]?, locations: [NSNumber]?) -> Link {
        self.base.config(mode: mode, colors: colors, locations: locations)
        return self
    }
}
