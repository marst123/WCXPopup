import UIKit
import QuartzCore


//MARK: - CAShapeLayer属性扩展

public extension Link where Base: CAShapeLayer {
    
    /// 路径
    @discardableResult
    func appendPath(_ path: CGPath?) -> Link {
        self.base.path = path
        return self
    }
    
    /// 填充
    /// - Parameters:
    ///   - mode: 填充规则 非零和奇偶数;默认非零
    ///   - fillColor: 填充颜色
    @discardableResult
    func fill(_ mode: CAShapeLayerFillRule? = nil, fillColor: UIColor?) -> Link {
        if let mode = mode {
            self.base.fillRule = mode
        }
        self.base.fillColor = fillColor?.cgColor
        return self
    }
    
    /// 线条
    @discardableResult
    func line(_ lineWidth: CGFloat, color: UIColor) -> Link {
        self.base.lineWidth = lineWidth
        self.base.strokeColor = color.cgColor
        return self
    }
    
    /// 连接点样式 (起始与终点)
    /// - Parameter mode: butt矩形/round圆弧/斜角
    @discardableResult
    func lineCap(_ mode: CAShapeLayerLineCap) -> Link {
        self.base.lineCap = mode
        return self
    }
    
    /// 连结点样式
    /// - Parameter mode: miter直切角/round圆弧/bevel折角也就是平角
    @discardableResult
    func lineJoin(_ mode: CAShapeLayerLineJoin) -> Link {
        self.base.lineJoin = mode
        return self
    }
    
    /// 全路径截取 进度起始百分比 0~1
    @discardableResult
    func stroke(start: CGFloat, end: CGFloat) -> Link {
        self.base.strokeStart = start
        self.base.strokeEnd = end
        return self
    }
    
    /// 虚线
    /// - Parameter dashPattern: 虚线间隔样式  如数组[10,20,5,20]表示:长度为10的线,长度为20的空白,长度为5的线,长度为20的空白
    @discardableResult
    func lineDashPattern(_ dashPattern: [NSNumber]?) -> Link {
        self.base.lineDashPhase = 0 // 虚线起始点
        self.base.lineDashPattern = dashPattern
        return self
    }
    
}
