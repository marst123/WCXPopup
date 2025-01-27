import UIKit


//MARK: - UIScrollView属性扩展

public extension Link where Base: UIScrollView {
    
    /// 代理对象
    @discardableResult
    func delegate(_ delegate: UIScrollViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    /// 是否只允许在一个方向上滚动
    @discardableResult
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Link {
        self.base.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    /// 是否允许弹性滚动
    @discardableResult
    func bounces(_ bounces: Bool) -> Link {
        self.base.bounces = bounces
        return self
    }
        
    /// 是否垂直方向上弹性滚动
    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Link {
        self.base.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    /// 是否水平方向上弹性滚动
    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Link {
        self.base.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    
    /// 是否启用分页
    @discardableResult
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Link {
        self.base.isPagingEnabled = isPagingEnabled
        return self
    }
    
    /// 是否可以滚动
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Link {
        self.base.isScrollEnabled = isScrollEnabled
        return self
    }
    
    /// 否显示水平滚动条
    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Link {
        self.base.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    /// 是否显示垂直滚动条
    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Link {
        self.base.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    /// 可视范围内,左上角点的坐标
    @discardableResult
    func contentOffset(x: CGFloat, y: CGFloat) -> Link {
        self.base.contentOffset = CGPoint(x: x, y: y)
        return self
    }
    
    /// 内容大小
    @discardableResult
    func contentSize(width: CGFloat, height: CGFloat) -> Link {
        self.base.contentSize = CGSize(width: width, height: height)
        return self
    }
    
    /// 内容内边距
    @discardableResult
    func contentInset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    /// 内容缩进行为
    @discardableResult
    @available(iOS 11.0, *)
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Link {
        self.base.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    /// 滚动条内边距
    @discardableResult
    func scrollIndicatorInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.scrollIndicatorInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    /// 滚动控件键盘消失风格
    @discardableResult
    func keyboardDismiss(_ mode: UIScrollView.KeyboardDismissMode) -> Link {
        self.base.keyboardDismissMode = mode
        return self
    }
}
