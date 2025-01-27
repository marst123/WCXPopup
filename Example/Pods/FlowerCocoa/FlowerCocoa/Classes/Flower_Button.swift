import UIKit


//MARK: - UIButton属性扩展

public extension Link where Base: UIButton {
    
    /// Normal配置
    @discardableResult
    func stateNormal(_ clo: ((Flower_ButtonMode) -> ())) -> Link<Base> {
        clo(.normal(self.base))
        return self
    }
    
    /// Selected配置
    @discardableResult
    func stateSelected(_ clo: ((Flower_ButtonMode) -> ())) -> Link<Base> {
        clo(.selected(self.base))
        return self
    }
    
    /// Highlighted配置
    @discardableResult
    func stateHighlighted(_ clo: ((Flower_ButtonMode) -> ())) -> Link<Base> {
        clo(.highlighted(self.base))
        return self
    }
    
    /// Disabled配置
    @discardableResult
    func stateDisabled(_ clo: ((Flower_ButtonMode) -> ())) -> Link<Base> {
        clo(.disabled(self.base))
        return self
    }
    
    /// titleLabel位置
    @discardableResult
    func alignment(_ textAlignment: NSTextAlignment) -> Link {
        self.base.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    /// 文字行数
    @discardableResult
    func lines(_ numberOfLines: Int) -> Link {
        self.base.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    /// 是否选中
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Link {
        self.base.isSelected = isSelected
        return self
    }
    
    /// title内边距
    @discardableResult
    func titleEdge(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    /// image内边距
    @discardableResult
    func imageEdge(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.imageEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }

    /// content内边距
    @discardableResult
    func contentEdge(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.contentEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    /// 图文位置
    /// - Parameters:
    ///   - style: 位置模式
    ///   - space: 间距
    @discardableResult
    func defaultEdges(style: ButtonEdgeInsetsStyle, space:CGFloat) -> Link {
        self.base.edgeLayout(style, space: space)
        return self
    }
    
    /// 唯一标识
    @discardableResult
    func setIdentifier(identifier: String) -> Link {
        self.base.identifier = identifier
        return self
    }
    
    /// 标签
    @discardableResult
    func setTag(tag: Int) -> Link {
        self.base.tag = tag
        return self
    }
    
    /// normal文本
    @discardableResult
    func titleForNormal(_ title: String) -> Link {
        self.base.setTitle(title, for: .normal)
        return self
    }
    
    /// normal富文本
    @discardableResult
    func attrTitleForNormal(_ attrTitle: NSAttributedString?) -> Link {
        self.base.setAttributedTitle(attrTitle, for: .normal)
        return self
    }
    
    /// normal标题颜色
    @discardableResult
    func titleColorForNormal(_ titleColor: UIColor?) -> Link {
        self.base.setTitleColor(titleColor, for: .normal)
        return self
    }
    
    /// normal图片
    @discardableResult
    func imageForNormal(_ image: UIImage?) -> Link {
        self.base.setImage(image, for: .normal)
        return self
    }
    
    /// normal背景图片
    @discardableResult
    func backgroundImageForNormal(_ image: UIImage?) -> Link {
        self.base.setBackgroundImage(image, for: .normal)
        return self
    }
    
    /// normal文本
    @discardableResult
    func titleForSelected(_ title: String) -> Link {
        self.base.setTitle(title, for: .selected)
        return self
    }
    
    /// normal富文本
    @discardableResult
    func attrTitleForSelected(_ attrTitle: NSAttributedString?) -> Link {
        self.base.setAttributedTitle(attrTitle, for: .selected)
        return self
    }
    
    /// normal标题颜色
    @discardableResult
    func titleColorForSelected(_ titleColor: UIColor?) -> Link {
        self.base.setTitleColor(titleColor, for: .selected)
        return self
    }
    
    /// normal图片
    @discardableResult
    func imageForSelected(_ image: UIImage?) -> Link {
        self.base.setImage(image, for: .selected)
        return self
    }
    
    /// normal背景图片
    @discardableResult
    func backgroundImageForSelected(_ image: UIImage?) -> Link {
        self.base.setBackgroundImage(image, for: .selected)
        return self
    }
    
    // 管理button方法硬编码
    
}


//MARK: - UIControl.State枚举方法

public enum Flower_ButtonMode {
    
    case normal(UIButton)
    
    case selected(UIButton)
    
    case highlighted(UIButton)
    
    case disabled(UIButton)
    
    @discardableResult
    public func title(_ title: String?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setTitle(title, for: .normal)
        case .selected(let pSButton):
            pSButton.setTitle(title, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setTitle(title, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setTitle(title, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    public func titleColor(_ color: UIColor?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setTitleColor(color, for: .normal)
        case .selected(let pSButton):
            pSButton.setTitleColor(color, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setTitleColor(color, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setTitleColor(color, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    public func attrTitle(_ attrText: NSAttributedString?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .normal)
        case .selected(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    public func image(_ image: UIImage?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setImage(image, for: .normal)
        case .selected(let pSButton):
            pSButton.setImage(image, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setImage(image, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setImage(image, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    public func backgroundImage(_ image: UIImage?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setBackgroundImage(image, for: .normal)
        case .selected(let pSButton):
            pSButton.setBackgroundImage(image, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setBackgroundImage(image, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setBackgroundImage(image, for: .disabled)
        }
        return self
    }
    
}



