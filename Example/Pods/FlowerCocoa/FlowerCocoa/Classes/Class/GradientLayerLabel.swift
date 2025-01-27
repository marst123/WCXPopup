import UIKit

public class GradientLayerLabel: UILabel {
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func config(mode: CAGradientLayerPointDirection, colors: [CGColor]?, locations: [NSNumber]?) {
        gradientLayer?.colors = colors
        gradientLayer?.locations = locations
        gradientLayer?.startPoint = mode.point.0
        gradientLayer?.endPoint = mode.point.1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
