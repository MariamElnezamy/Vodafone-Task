//
//  Extensions.swift
//  Vodafone Task
//
//  Created by Admin on 20/09/2021.
//

import UIKit

extension UIView {
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    func getShadow(yourView: UIView) {
        yourView.layer.shadowColor = UIColor.black.cgColor
        yourView.layer.shadowOpacity = 1
        yourView.layer.shadowOffset = .zero
        yourView.layer.shadowRadius = 10
        yourView.layer.shadowPath = UIBezierPath(rect: yourView.bounds).cgPath
    }
    func addTopBorder(color: CGColor, heightBorder: Float) {
       let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: CGFloat(heightBorder))
       topBorder.backgroundColor = color
       self.layer.addSublayer(topBorder)
    }
    func roundCornersToSide(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        self.clipsToBounds = true
    }
    
}

extension UIViewController {
    func customAlert(_ title:String ,_ message:String){
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      self.present(alert, animated: true)
    }
    func openURL(url: String){
        if url.contains("https://"){
            guard let url = URL(string: url) else {return}
            UIApplication.shared.open(url)
        }else{
            guard let url = URL(string: "https://\(url)") else {return}
            UIApplication.shared.open(url)
        }
    }
}
