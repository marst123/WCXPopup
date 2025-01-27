import UIKit


//MARK: - CATextLayer属性扩展

public extension Link where Base: CATextLayer {
    
    /// 是否像素化
    @discardableResult
    func allowsFontSubpixelQuantization(_ subpixelQuantization: Bool) -> Link {
        self.base.allowsFontSubpixelQuantization = subpixelQuantization
        return self
    }
    
    /// 截断方式
    @discardableResult
    func truncation(_ mode: CATextLayerTruncationMode) -> Link {
        self.base.truncationMode = mode
        return self
    }
    
    /// 对齐方式
    @discardableResult
    func alignment(_ mode: CATextLayerAlignmentMode) -> Link {
        self.base.alignmentMode = mode
        return self
    }
    
    /// font: 字体
    /// fontSize: 字号大小
    /// color:  文字颜色
    @discardableResult
    func config(font: CFTypeRef? = nil, fontSize: CGFloat, color: UIColor) -> Link {
        self.base.font = font
        self.base.fontSize = fontSize
        self.base.foregroundColor = color.cgColor
        return self
    }
    
    /// text: 字符串 或 富文本
    /// isWrapped: 是否换行
    @discardableResult
    func string(_ text: Any?, isWrapped: Bool = false) -> Link {
        self.base.string = text
        self.base.isWrapped = isWrapped
        return self
    }
}
