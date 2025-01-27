import UIKit

/*
 extension Link where Base: Flower_Label
 这段代码是Link结构体的一个扩展，使用了泛型where子句.来限制Link的泛型类型参数Base只能是Flower_Label的子类
 也就是self.base 是当前 Base 泛型类型的子类,在这里 self.base 为Flower_Label的子类
 */


//MARK: - UILabel属性扩展

public extension Link where Base: UILabel {

    /// 是否高亮
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Link {
        self.base.isHighlighted = isHighlighted
        return self
    }
    
    /// 文本颜色
    @discardableResult
    func textColor(_ color: UIColor?) -> Link {
        self.base.textColor = color
        return self
    }
    
    /// 高亮状态下的文本颜色
    @discardableResult
    func highlightedTextColor(_ color: UIColor?) -> Link {
        self.base.highlightedTextColor = color
        return self
    }
    
    /// 文本对齐方式
    @discardableResult
    func alignment(_ textAlignment: NSTextAlignment) -> Link {
        self.base.textAlignment = textAlignment
        return self
    }
    
    /// 最大行数
    @discardableResult
    func lines(_ numberOfLines: Int) -> Link {
        self.base.numberOfLines = numberOfLines
        return self
    }
    
    /// 文本
    @discardableResult
    func text(_ title: String?) -> Link<Base> {
        self.base.text = title
        return self
    }
    
    /// 富文本
    @discardableResult
    func attributedText(_ title: NSAttributedString?) -> Link<Base> {
        self.base.attributedText = title
        return self
    }

    /// 截断方式
    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> Link {
        self.base.lineBreakMode = mode
        return self
    }
    
    /// 最小缩放比例
    @discardableResult
    func minimumScale(_ scale: CGFloat) -> Link {
        self.base.minimumScaleFactor = scale
        return self
    }
}


//MARK: - 针对InsetLabel新增扩展

public extension Link where Base: InsetLabel {
    
    /// 文本内边距
    @discardableResult
    func titleEdges(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.textInsets.top = top
        self.base.textInsets.left = left
        self.base.textInsets.bottom = bottom
        self.base.textInsets.right = right
        return self
    }
}
