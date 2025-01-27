import UIKit


public enum TextFieldTrait { }
public enum KeyBoardTrait { }


//MARK: - UITextField属性扩展

public extension Link where Base: UITextField {
    
    /// 文本视图的代理
    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    /// 文本框样式，例如 none、line、bezel、roundedRect
    @discardableResult
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Link {
        self.base.borderStyle = borderStyle
        return self
    }
    
    /// 左侧视图的显示模式
    @discardableResult
    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Link {
        self.base.leftViewMode = leftViewMode
        return self
    }
    
    /// 左侧视图
    @discardableResult
    func leftView(_ leftView: UIView?) -> Link {
        self.base.leftView = leftView
        return self
    }
    
    /// 右侧视图的显示模式
    @discardableResult
    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Link {
        self.base.rightViewMode = rightViewMode
        return self
    }
    
    /// 右侧视图
    @discardableResult
    func rightView(_ rightView: UIView?) -> Link {
        self.base.rightView = rightView
        return self
    }
    
    /// 文本清除
    @discardableResult
    func clear() -> Link {
        self.base.text = ""
        self.base.attributedText = NSAttributedString(string: "")
        return self
    }

    /// 占位文本和文本颜色
    @discardableResult
    func placeholder(_ text: String, _ color: UIColor) -> Link {
        if !text.isEmpty {
            self.base.placeholder = text
            self.base.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: color])
        }
        return self
    }

    /// 左侧文本填充区域
    @discardableResult
    func paddingLeft(_ padding: CGFloat) -> Link {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.base.frame.height))
        self.base.leftView = paddingView
        self.base.leftViewMode = .always
        return self
    }

    /// 左侧图片填充区域
    @discardableResult
    func paddingLeftIcon(_ image: UIImage, padding: CGFloat) -> Link {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.base.leftView = imageView
        self.base.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.base.leftViewMode = .always
        return self
    }
}
