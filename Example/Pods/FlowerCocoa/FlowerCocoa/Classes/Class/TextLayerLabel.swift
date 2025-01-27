import UIKit
import CoreText

class TextLayerLabel: UILabel {
    
    private let textLayer = CATextLayer()
    
    override var attributedText: NSAttributedString? {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func drawText(in rect: CGRect) {
        // Don't draw text directly
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let attributedText = attributedText else {
            return
        }
        
        let size = bounds.size
        let textRect = attributedText.boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        let height = ceil(textRect.height)
        let width = ceil(textRect.width)
        
        textLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        textLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        textLayer.alignmentMode = .center
        textLayer.string = attributedText
        
        layer.addSublayer(textLayer)
    }
    
}

