//
//  Animation.swift
//  Navigation
//
//  Created by MacBook Air on 15.01.2023.
//

import UIKit

func backgroundErrorAnimation(_ field: UITextField) {
    UIView.animate(withDuration: 0.5) {
        field.backgroundColor = UIColor(named: "myErrorRed")
    } completion: { _ in
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            field.backgroundColor = .systemGray6
        }
    }
}

extension UIView {

    func shake1() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = 3
        animation.duration = 0.1
        animation.autoreverses = true
        animation.values = [5, -5]
        layer.add(animation, forKey: "shake")
    }

    func shake2() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

public func shake3(view: UIView) {

    let propertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.3) {
        view.transform = CGAffineTransform(translationX: 10, y: 0)
    }
    propertyAnimator.addAnimations({view.transform = CGAffineTransform(translationX: 0, y: 0)}, delayFactor: 0.2)
    propertyAnimator.startAnimation()
}

