import UIKit


//MARK: - UIBezierPath属性扩展

public extension Link where Base: UIBezierPath {

    /// 起点
    @discardableResult
    func moveToPoint(_ point: CGPoint) -> Link {
        self.base.move(to: point)
        return self
    }
    
    /// 中途点
    @discardableResult
    func addLineToPoint(_ point: CGPoint) -> Link {
        self.base.addLine(to: point)
        return self
    }
    
    /// 单点曲线
    /// - Parameters:
    ///   - point: 结束点
    ///   - controlPoint: 控制曲面的点
    @discardableResult
    func addQuadCurve(_ point: CGPoint, controlPoint: CGPoint) -> Link {
        self.base.addQuadCurve(to: point, controlPoint: controlPoint)
        return self
    }

    /// 双点曲线
    /// - Parameters:
    ///   - point: 结束点
    ///   - controlPoint1: 控制曲面的点1
    ///   - controlPoint2: 控制曲面的点2
    @discardableResult
    func addLineToPoint(_ point: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) -> Link {
        self.base.addCurve(to: point, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        return self
    }
    
    /// 封闭曲线节点(创造一个首尾相连)
    @discardableResult
    func closePath() -> Link {
        self.base.close()
        return self
    }
    
}
