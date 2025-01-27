import UIKit


//MARK: - UIImageView属性扩展

public extension Link where Base: UIImageView {

    /// 是否高亮
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Link {
        self.base.isHighlighted = isHighlighted
        return self
    }
    
    /// 图片
    @discardableResult
    func image(_ image: UIImage?) -> Link {
        self.base.image = image
        return self
    }
    
    /// 高亮图状态片
    @discardableResult
    func highlightedImage(_ image: UIImage?) -> Link {
        self.base.highlightedImage = image
        return self
    }
    
    /// 帧动画的图片数组
    @discardableResult
    func animationImages(_ images: [UIImage]?) -> Link {
        self.base.animationImages = images
        return self
    }
    
    /// 高亮状态帧动画的图片数组
    @discardableResult
    func highlightedAnimationImages(_ images: [UIImage]?) -> Link {
        self.base.highlightedAnimationImages = images
        return self
    }
    
    /// 帧动画时常
    @discardableResult
    func animationDuration(_ duration: TimeInterval) -> Link {
        self.base.animationDuration = duration
        return self
    }
    
    /// 帧动画次数
    @discardableResult
    func animationRepeatCount(_ count: Int) -> Link {
        self.base.animationRepeatCount = count
        return self
    }
}
