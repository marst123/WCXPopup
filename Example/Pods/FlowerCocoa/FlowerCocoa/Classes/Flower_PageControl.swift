import UIKit


//MARK: - UIPageControl属性扩展

public extension Link where Base: UIPageControl {
    
    /// 是否隐藏单页时的圆点
    @discardableResult
    func hidesForSinglePage(_ hidesForSinglePage: Bool) -> Link {
        self.base.hidesForSinglePage = hidesForSinglePage
        return self
    }
    
    /// 当前页码
    @discardableResult
    func currentPage(_ currentPage: Int) -> Link {
        self.base.currentPage = currentPage
        return self
    }
    
    /// 页控件的页数
    @discardableResult
    func numberOfPages(_ numberOfPages: Int) -> Link {
        self.base.numberOfPages = numberOfPages
        return self
    }
    
    /// 未选中圆点的颜色
    @discardableResult
    func tintColor(_ color: UIColor) -> Link {
        self.base.pageIndicatorTintColor = color
        return self
    }
    
    /// 选中圆点的颜色
    @discardableResult
    func currentTintColor(_ color: UIColor) -> Link {
        self.base.currentPageIndicatorTintColor = color
        return self
    }
    
}
