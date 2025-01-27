import UIKit



public class InsetLabel: UILabel {
    // 1.定义一个接受间距的属性
    var textInsets = UIEdgeInsets.zero {
        didSet {
            // 内边距变化时，重新布局文本
            setNeedsLayout()
        }
    }
    
    //2. 返回 label 重新计算过 text 的 rectangle
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        guard text != nil else {
            return super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        }
        
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    //3. 绘制文本时，对当前 rectangle 添加间距
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
}

@IBDesignable
extension InsetLabel {
    @IBInspectable
    var leftTextInset: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left}
    }
    
    @IBInspectable
    var topTextInset: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top}
    }
    
    @IBInspectable
    var rightTextInset: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right}
    }
    
    @IBInspectable
    var bottomTextInset: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom}
    }
}
