
import Foundation
import UIKit



extension UIViewController {
    
    
    func addDefaultAlert (title: String, message: String, defaultTitle: String , cancelTitle: String, destractiveTitle: String, okAction: (() -> Void)?, cancelAction: (()-> Void)?, destractiveAction: (()->Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: defaultTitle, style: .default) { (_) in
            
            if let action = okAction {
                action()
            }
        }
        
        let destract = UIAlertAction(title: destractiveTitle, style: .default) { (_) in
            if let action = destractiveAction {
                action()
            }
        }
        
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { (_) in
            if let action = cancelAction {
                action()
            }
        }
        
       
        
        alert.addAction(ok)
        alert.addAction(destract)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
