//
//  HudAnimationView.swift
//  Sumla
//
//  Created by Brang Mai on 5/10/22.
//

import UIKit

class HudAnimationView: UIView {
    var message = ""
    
    class func hud(inView view: UIView, animated: Bool) -> HudAnimationView {
        let hudAnimationView = HudAnimationView(frame: view.bounds)
        hudAnimationView.isOpaque = false
        
        view.addSubview(hudAnimationView)
        view.isUserInteractionEnabled = false
        
        hudAnimationView.show(animated: animated)
        return hudAnimationView
    }

    
//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        
        let rectangleBox = CGRect(
            x: round((bounds.size.width - boxWidth) / 2),
            y: round((bounds.size.height - boxHeight) / 2),
            width: boxWidth,
            height: boxHeight)
        
        let roundedRectangle = UIBezierPath(roundedRect: rectangleBox, cornerRadius: 10)
        UIColor(white: 0.3, alpha: 0.8).setFill()
        roundedRectangle.fill()
        
        // Draw the text box
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        let textSize = message.size(withAttributes: attributes)
        let textPoint = CGPoint(
            x: center.x - round(textSize.width / 2),
            y: center.y - round(textSize.height / 2) + boxHeight / 4)
        message.draw(at: textPoint, withAttributes: attributes)
    }
    
    func show(animated: Bool) {
        if animated {
            alpha = 0
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            UIView.animate(withDuration: 0.3, delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.5, options: [],
                           animations: {
                                self.alpha = 1
                                self.transform = CGAffineTransform.identity
                            },
                           completion: nil)
        }
        
    }
    
    func hide() {
        superview?.isUserInteractionEnabled = true
        removeFromSuperview()
    }

}
