import UIKit
import QuartzCore


/*
 CATransformLayer 是一个特殊的 CALayer 类型.它允许将其子图层组织成一个可旋转的 3D 图层结构。
 在 CATransformLayer 中，所有的子图层共享同一个 3D 坐标系，这些子图层在 3D 空间中排列
 它可以用来创建3D场景、虚拟现实界面等复杂的图形效果
 1. 创建子视图
 2. 将子视图通过addSublayer添加到CATransformLayer实例
 3. 设置transform属性 (效果)
 4. 将CATransformLayer对象通过addSublayer添加到父layer图层中
 */


//MARK: - CATransformLayer属性扩展

public extension Link where Base: CATransformLayer {
    
    /*
     zPosition 是一个浮点型数值，用于控制子图层在 3D 坐标系中的位置，以此来决定子图层的前后顺序。
     zPosition 越大的子图层会出现在 zPosition 较小的子图层之前。zPosition 越大的子图层就会在 3D 空间中更靠近相机
     */
    /// z轴属性
    @discardableResult
    func zPosition(_ z: CGFloat) -> Link {
        self.base.zPosition = z
        return self
    }
    
    /*
     用于控制子图层在 3D 空间中的旋转、缩放和平移等变换
     */
    /// 设置CATransform3D 类型
    @discardableResult
    func transform(_ transform: CATransform3D) -> Link {
        self.base.transform = transform
        return self
    }
    
}
