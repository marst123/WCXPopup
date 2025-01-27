import UIKit
import WCXPopup

class PopupViewController: UIViewController, WCXPopupDelegate {
    func popupViewContentHeight(_ identifier: String) -> CGFloat {
        switch identifier {
        case "VIEW_BOTTOM":
            return 142
        case "VIEW_TOP":
            return 100
        case "VIEW_LEFT":
            return UIScreen.main.bounds.height
        case "VIEW_RIGHT":
            return UIScreen.main.bounds.height
        case "VIEW_CENTER":
            return 142
        default:
            return 0
        }

    }

    let button_bottom: UIButton = UIButton().link.bgColor(.black).titleColorForNormal(.white).titleForNormal("点击弹窗(底部)").base
    
    let button_top: UIButton = UIButton().link.bgColor(.black).titleColorForNormal(.white).titleForNormal("点击弹窗(顶部)").base

    let button_left: UIButton = UIButton().link.bgColor(.black).titleColorForNormal(.white).titleForNormal("点击弹窗(左侧)").base

    let button_right: UIButton = UIButton().link.bgColor(.black).titleColorForNormal(.white).titleForNormal("点击弹窗(右侧)").base

    let button_center: UIButton = UIButton().link.bgColor(.black).titleColorForNormal(.white).titleForNormal("点击弹窗(居中)").base

    /// stackView - buttons
    lazy var stackView: UIStackView = {
        return UIStackView().link
            .config(.vertical, alignment: .fill, distribution: .fillEqually, spacing: 30)
            .arrangedAdd([button_bottom, button_top, button_left, button_right, button_center])
            .base
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "示例"
        // Do any additional setup after loading the view.
        view.add(subview: stackView)
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        // Perform binding operation
        button_bottom.setAction { sender in
            let bottomView = UIView()
            WCXPopupManager.shared.showPopup(type: .bottom, hideType: .slideToBottom, contentView: bottomView, identifier: "VIEW_BOTTOM", delegate: self, isTapGestureMaskView: true)
        }
        
        button_top.setAction { sender in
            let bottomView = UIView()
            WCXPopupManager.shared.showPopup(type: .top, hideType: .slideToTop, contentView: bottomView, identifier: "VIEW_TOP", delegate: self, isTapGestureMaskView: true)
        }
        
        button_left.setAction { sender in
            let bottomView = UIView()
            WCXPopupManager.shared.showPopup(type: .cut(leftPaading: 0, rightPaading: 80), showType: .slideFromLeft, hideType: .slideToLeft, contentView: bottomView, identifier: "VIEW_LEFT", delegate: self, isTapGestureMaskView: true)
        }
        
        button_right.setAction { sender in
            let bottomView = UIView()
            WCXPopupManager.shared.showPopup(type: .cut(leftPaading: 80, rightPaading: 0), showType: .slideFromRight, hideType: .slideToRight, contentView: bottomView, identifier: "VIEW_RIGHT", delegate: self, isTapGestureMaskView: true)
        }
        
        button_center.setAction { sender in
            let bottomView = UIView()
            WCXPopupManager.shared.showPopup(type: .center(paading: 50), showType: .bounce, contentView: bottomView, identifier: "VIEW_CENTER", delegate: self, isTapGestureMaskView: true)
        }
    }

    

}
