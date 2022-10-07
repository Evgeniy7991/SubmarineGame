


import UIKit




class GameOverViewController: UIViewController {

  
        
        var arraySharks: [String] = []
        var arrayShips: [String] = []
        var arrayDifficulties: [String] = []
        var arrayColors: [UIColor] = []
        
        
        @IBOutlet weak var difficultiesLabel: UILabel!
        @IBOutlet weak var shildColorView: UIView!
        
        @IBOutlet weak var sharkImageView: UIImageView!
        @IBOutlet weak var shipImageView: UIImageView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.shildColorView.layer.cornerRadius = shildColorView.frame.height/2
            self.loadFish()
            
            
            
        }
        
        
        @IBAction func rightSwipeDetected () {
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        @IBAction func backButtomPressed(_ sender: UIButton) {
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        
        
        @IBAction func rightSharkButtomPressed(_ sender: UIButton) {
            self.plusFihs()
        }
        
        @IBAction func leftSharkButtomPressed(_ sender: UIButton) {
            self.minusFish()
        }
        
        @IBAction func rightShipButtonPressed(_ sender: UIButton) {
            self.plusShip()
        }
        
        @IBAction func leftShipButtomPressed(_ sender: UIButton) {
            self.minusShip()
        }
        
        @IBAction func rightColorButtomPressed(_ sender: UIButton) {
            self.plusColor()
        }
        
        @IBAction func leftColorButtonPresse(_ sender: UIButton) {
            self.minusColor()
        }
        
        @IBAction func rightDificultGameButtomPressed(_ sender: UIButton) {
            self.plusHardness()
        }
        
        @IBAction func leftDificultGameButtomPresed(_ sender: UIButton) {
            self.minusHardness()
        }
        
        
        private func loadFish () {
            
            if UserDefaults.standard.value(Settings.self, forKey: "settings") == nil {
                
                let set = Settings(numberColor: 0, numberShark: 0, numberShip: 0, numberDifficultGame: 0, name: "Your name", numberSubmarine: 0)
                UserDefaults.standard.set(encodable: set, forKey: "settings")
                
                guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
                self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
                self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
                self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
                self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
                
                
            } else {
                
                guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
                self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
                self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
                self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
                self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        private func plusFihs () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { print("return"); return }
            
            settings.numberShark += 1
            
            if settings.numberShark >= self.arraySharks.count {
                settings.numberShark = self.arraySharks.count-1
            }
            
            print("Plus \(settings.numberShark)")
            self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
        }
        
        private func minusFish () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberShark -= 1
            
            if settings.numberShark <= 0 {
                settings.numberShark = 0
            }
            
            print("Minus \(settings.numberShark)")
            self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            
        }
        
        
        
        private func plusShip () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberShip += 1
            
            if settings.numberShip >= self.arrayShips.count {
                settings.numberShip = self.arrayShips.count-1
            }
            
            print("Plus \(settings.numberShip)")
            self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
        }
        
        private func minusShip () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberShip -= 1
            
            if settings.numberShip <= 0 {
                settings.numberShip = 0
            }
            
            print("Minus \(settings.numberShip)")
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
        }
        
        
        
        
        private func plusColor () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberColor += 1
            
            if settings.numberColor >= self.arrayColors.count {
                settings.numberColor = self.arrayColors.count-1
            }
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
        }
        
        private func minusColor () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberColor -= 1
            
            if settings.numberColor <= 0 {
                settings.numberColor = 0
            }
            
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
        }
        
        
        
        
        private func plusHardness () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberDifficultGame += 1
            
            if settings.numberDifficultGame >= self.arrayDifficulties.count {
                settings.numberDifficultGame = self.arrayDifficulties.count-1
            }
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
        }
        
        private func minusHardness () {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return }
            
            settings.numberDifficultGame -= 1
            
            if settings.numberDifficultGame <= 0 {
                settings.numberDifficultGame = 0
            }
            
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
        }
}
