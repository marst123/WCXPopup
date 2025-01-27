import UIKit


//MARK: - UIStackView属性扩展

public extension Link where Base: UIStackView {
    
    /// 添加子视图
    @discardableResult
    func arrangedAdd(_ subviews: [UIView]) -> Link {
        subviews.forEach { view in
            self.base.addArrangedSubview(view)
        }
        return self
    }
    
    /// 添加子视图
    @discardableResult
    func arrangedRemove(_ subviews: [UIView]) -> Link {
        subviews.forEach { view in
            self.base.removeArrangedSubview(view)
        }
        return self
    }
    
    /// 配置
    /// - Parameters:
    ///   - axis: 布局方向
    ///   - alignment: 对齐方式
    ///   - distribution: 分布方式
    ///   - spacing: 间距
    @discardableResult
    func config(_ axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat) -> Link {
        self.base.axis = axis
        self.base.alignment = alignment
        self.base.distribution = distribution
        self.base.spacing = spacing
        return self
    }

}
