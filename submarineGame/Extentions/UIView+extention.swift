
import UIKit

extension UIView {

    func rounded (radious: CGFloat = 15) {
        self.layer.cornerRadius = radious
    }

    func dropShadow () {

        layer.masksToBounds = false  // ten rasprostranyaetsa za predeli konteynera
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8 // prozrachnost
        layer.shadowOffset = CGSize(width: 8, height: 8) // pereneshenie teni po koordinatam
        layer.shadowRadius = 15 // vistup teni ot view

        //        layer.shadowPath = UIBezierPath(rect: bounds).cgPath

        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.width/2).cgPath // kruglaya view

        layer.shouldRasterize = true

    }

    func addGradient () {

        let gradient = CAGradientLayer()

        gradient.colors = [ UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor ]
        gradient.opacity = 0.6
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addConstraint ( _ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addConstraintForButton( _ leading: UIView, _ trailing: UIView, _ top: UIView, _ buttom: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: leading.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: trailing.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: top.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: buttom.bottomAnchor).isActive = true
    }
    
}
