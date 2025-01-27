import UIKit



public enum WCXAnimationShowType {
    case none
    case bounce
    case slideFromTop
    case slideFromBottom
    case slideFromLeft
    case slideFromRight
    // Add more animation types here as needed
}

public enum WCXAnimationHideType {
    case none
    case bounce
    case slideToTop
    case slideToBottom
    case slideToLeft
    case slideToRight
    // Add more animation types here as needed
}

public enum WCXPopupType {
    case top
    case bottom
    case center(paading: CGFloat)
    case cut(leftPaading: CGFloat, rightPaading: CGFloat)
}

public protocol WCXPopupDelegate: AnyObject {
    func popupViewContentHeight(_ identifier: String) -> CGFloat
}

public class PopupView: UIView, CAAnimationDelegate {
    weak var delegate: WCXPopupDelegate?
    var type: WCXPopupType = .bottom
    var animationShowType: WCXAnimationShowType = .none
    var animationHideType: WCXAnimationHideType = .none
    private var animationCompletion: (() -> Void)?
    
    // Rest of your code for popup views
    var contentView: UIView? {
        didSet {
            // Remove any existing custom content view and add the new one
            oldValue?.removeFromSuperview()
            if let customContentView = contentView {
                customContentView.backgroundColor = .white
                customContentView.translatesAutoresizingMaskIntoConstraints = false
                addSubview(customContentView)
                
                NSLayoutConstraint.activate([
                    customContentView.topAnchor.constraint(equalTo: topAnchor),
                    customContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    customContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    customContentView.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
            }
        }
    }
    
    func animateShow(_ type: WCXAnimationShowType, xOrY: CGFloat = 0) {
        switch type {
        case .none:
            // No animation
            break
        case .bounce:
            // Jelly-like bouncing animation
            let animation = CAKeyframeAnimation(keyPath: "transform.scale")
            animation.values = [0.6, 1.2, 0.9, 1.0]
            animation.keyTimes = [0, 0.4, 0.7, 1]
            animation.timingFunctions = [
                CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            ]
            animation.duration = 0.3
            layer.add(animation, forKey: "bounceShowAnimation")
        case .slideFromTop:
            // Slide in from top animation
            frame.origin.y = -frame.height
            UIView.animate(withDuration: 0.3) {
                self.frame.origin.y = xOrY
            }
        case .slideFromBottom:
            // Slide in from bottom animation
            if let window = UIApplication.shared.windows.first {
                frame.origin.y = window.frame.height
            }
            UIView.animate(withDuration: 0.3) {
                self.frame.origin.y = xOrY
            }
        case .slideFromLeft:
            // Slide in from left animation
            frame.origin.x = -frame.width
            UIView.animate(withDuration: 0.3) {
                self.frame.origin.x = xOrY
            }
        case .slideFromRight:
            // Slide in from right animation
            frame.origin.x = frame.width
            UIView.animate(withDuration: 0.3) {
                self.frame.origin.x = xOrY
            }
        // Add more animation cases here as needed
        }
    }
    
    func animateHide(_ type: WCXAnimationHideType, completion: (() -> Void)? = nil) {
          switch type {
          case .none:
              // No hide animation
              completion?()
          case .bounce:
              // Jelly-like bouncing hide animation
              let animation = CAKeyframeAnimation(keyPath: "transform.scale")
              animation.values = [1.0, 1.1, 0.8, 0.1, 0.0]
              animation.keyTimes = [0, 0.2, 0.4, 0.7, 1]
              animation.timingFunctions = [
                  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
              ]
              animation.duration = 0.3
              animation.delegate = self // Set the delegate to handle animationDidStop(_:finished:)
              layer.add(animation, forKey: "bounceHideAnimation")
              // Store the completion block in the animation's userInfo dictionary
              animation.setValue(completion, forKey: "completionBlock")
          case .slideToTop:
              // Slide out to top animation
              UIView.animate(withDuration: 0.3, animations: {
                  self.frame.origin.y = -self.frame.height
              }) { _ in
                  completion?()
              }
          case .slideToBottom:
              // Slide out to bottom animation
              UIView.animate(withDuration: 0.3, animations: {
                  if let window = UIApplication.shared.windows.first {
                      self.frame.origin.y = window.frame.height
                  }
              }) { _ in
                  completion?()
              }
          case .slideToLeft:
              // Slide out to left animation
              UIView.animate(withDuration: 0.3, animations: {
                  self.frame.origin.x = -self.frame.width
              }) { _ in
                  completion?()
              }
          case .slideToRight:
              // Slide out to right animation
              UIView.animate(withDuration: 0.3, animations: {
                  if let window = UIApplication.shared.windows.first {
                      self.frame.origin.x = window.frame.width
                  }
              }) { _ in
                  completion?()
              }
          // Add more hide animation cases here as needed
          }
        // Set the completion block as the animation delegate
        self.animationCompletion = completion
      }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        animationCompletion?()
        animationCompletion = nil // Clear the completion block to avoid potential retain cycles
    }
}

public class WCXPopupManager: NSObject {
    public static let shared = WCXPopupManager()

    private var popupView: PopupView?
    private var backgroundView: UIView?
    private var isTapGestureMaskView: Bool = true // Default value, the overlay is clickable

    private override init() {}

    public func showPopup(type: WCXPopupType, showType: WCXAnimationShowType = .none, hideType: WCXAnimationHideType = .none, contentView: UIView, identifier: String, delegate: WCXPopupDelegate?, isTapGestureMaskView: Bool = true) {
        if let window = UIApplication.shared.windows.first {
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            window.addSubview(backgroundView)

            // Add tap gesture
            if isTapGestureMaskView {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(_:)))
                backgroundView.addGestureRecognizer(tapGesture)
            }

            NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: window.topAnchor),
                backgroundView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
            ])

            let popupView = PopupView()
            popupView.type = type
            popupView.delegate = delegate
            popupView.contentView = contentView
            popupView.animationShowType = showType
            popupView.animationHideType = hideType
            window.addSubview(popupView)
            
//            popupView.addSlideable_Y { direction in
//                switch direction {
//                case .up:
//                    print("向上 !!")
//                    popupView.animationHideType = .slideToTop
//                    self.hidePopup()
//                case .down:
//                    print("向下 !!")
//                    popupView.animationHideType = .slideToBottom
//                    self.hidePopup()
//                }
//
//            }
            
//            popupView.addSlideable_X { direction in
//                switch direction {
//                case .left:
//                    print("向左 !!")
//                    popupView.animationHideType = .slideToLeft
//                    self.hidePopup()
//                case .right:
//                    print("向右 !!")
//                    popupView.animationHideType = .slideToRight
//                    self.hidePopup()
//                }
//
//            }

            let popupHeight = delegate?.popupViewContentHeight(identifier) ?? 300.0

            // frame
            switch type {
            case .top:
                popupView.frame = CGRect(x: 0, y: -popupHeight, width: window.frame.width, height: popupHeight)
            case .bottom:
                popupView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: popupHeight)
            case .center(let padding):
                popupView.frame = CGRect(x: padding, y: window.frame.height/2 - popupHeight/2, width: window.frame.width - padding * 2, height: popupHeight)
            case .cut(let leftPaading, let rightPaading):
                popupView.frame = CGRect(x: leftPaading, y: window.frame.height/2 - popupHeight/2, width: window.frame.width - leftPaading - rightPaading, height: popupHeight)
            }

            // animate
            switch type {
            case .top:
                UIView.animate(withDuration: 0.3) {
                    popupView.frame.origin.y = 0
                }
            case .bottom:
                UIView.animate(withDuration: 0.3) {
                    popupView.frame.origin.y = window.frame.height - popupHeight
                }
            case .center(let padding):
                var xOrY: CGFloat = 0
                switch showType {
                case .slideFromTop, .slideFromBottom:
                    xOrY = window.frame.height/2 - popupHeight/2
                case .slideFromLeft, .slideFromRight:
                    xOrY = padding
                default:
                    break
                }
                popupView.animateShow(showType, xOrY: xOrY)

            case .cut(leftPaading: let leftPaading, rightPaading: let rightPaading):
                var xOrY: CGFloat = 0
                switch showType {
                case .slideFromTop, .slideFromBottom:
                    xOrY = window.frame.height/2 - popupHeight/2
                case .slideFromRight:
                    xOrY = leftPaading
                default:
                    break
                }
                popupView.animateShow(showType, xOrY: xOrY)
            }

            self.popupView = popupView
            self.backgroundView = backgroundView
            self.isTapGestureMaskView = isTapGestureMaskView
        }
    }

    func hidePopup() {
        if let popupView = self.popupView {
            
            // animate
            if let window = UIApplication.shared.windows.first {
                switch self.popupView?.type {
                case .top:
                    popupView.animateHide(popupView.animationHideType) {
                        popupView.removeFromSuperview()
                        self.backgroundView?.removeFromSuperview()
                    }
                case .bottom:
                    popupView.animateHide(popupView.animationHideType) {
                        popupView.removeFromSuperview()
                        self.backgroundView?.removeFromSuperview()
                    }
                case .center:
                    popupView.animateHide(popupView.animationHideType) {
                        popupView.removeFromSuperview()
                        self.backgroundView?.removeFromSuperview()
                    }
                case .cut:
                    popupView.animateHide(popupView.animationHideType) {
                        popupView.removeFromSuperview()
                        self.backgroundView?.removeFromSuperview()
                    }
                default:
                    break
                }
            }
            
        }
    }

    @objc private func backgroundTapped(_ sender: UITapGestureRecognizer) {
        // Call hidePopup() method to dismiss the popup when tapping on the overlay
        hidePopup()
    }
}


extension PopupView {
    
}
