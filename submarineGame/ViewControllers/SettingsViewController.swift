

import UIKit

//protocol SettingsViewControllerDelegate: AnyObject {
//    func adddImage()
//}




class SettingsViewController: UIViewController {
    
//    weak var delegate: StartGameViewControllerDelegate?
    
    var arraySharks: [String] = []
    var arrayShips: [String] = []
    var arrayDifficulties: [String] = []
    var arraySubmarine: [String] = []
    
    var arrayColors: [UIColor] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var difficultiesLabel: UILabel!
    @IBOutlet weak var shildColorView: UIView!
    
    @IBOutlet var nameTextField: [UITextField]!
    
    @IBOutlet weak var submarineImageView: UIImageView!
    @IBOutlet weak var sharkImageView: UIImageView!
    @IBOutlet weak var shipImageView: UIImageView!
    
    var stringName = "blabla"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shildColorView.layer.cornerRadius = shildColorView.frame.height/2
        self.loadFish()
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        self.nameLabel.text = settings.name
        
    }
    
    
    @IBAction func rightSwipeDetected () {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        self.addNameTextFild()
    }
    
    
    
    
    
    @IBAction func backButtomPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func rightSubmarineButtonPressed(_ sender: UIButton) {
        plusSubmarine()
    }
    
    @IBAction func leftSubmarineButtonPressed(_ sender: UIButton) {
        minusSubmarine()
    }
    
    
    
    
    @IBAction func rightSharkButtomPressed(_ sender: UIButton) {
        
//        guard var settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { print("return"); return }
//        self.plus(seting: settings, array: arraySharks, number: &settings.numberShark, imageView: sharkImageView)
        
        self.plusFihs()
    }
    
    
    
    
    @IBAction func leftSharkButtomPressed(_ sender: UIButton) {
        
//        guard var settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { print("return"); return }
//        self.minus(seting: &settings, array: arraySharks, number: &settings.numberShark, imageView: sharkImageView)
        
        
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
        
        if UserDefaults.standard.value(Settings.self, forKey: "settingss") == nil {
            
            let set = Settings(numberColor: 0, numberShark: 0, numberShip: 0, numberDifficultGame: 0, name: "Your name1", numberSubmarine: 0)
            UserDefaults.standard.set(encodable: set, forKey: "settingss")
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
            
            self.submarineImageView.image = UIImage(named: self.arraySubmarine[settings.numberSubmarine])
            self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
            self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
            self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
            self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
            
            
        } else {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
            
            self.submarineImageView.image = UIImage(named: self.arraySubmarine[settings.numberSubmarine])
            self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
            self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
            self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
            self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
        }
    }
    
    
//    private func plus (seting: Settings, array: [String], number: inout Int, imageView: UIImageView) {
//        
//        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { print("return"); return }
//        
//        number += 1
//        
//        if number >= array.count {
//            number = array.count-1
//        }
//        
//        
//        imageView.image = UIImage(named: array[number])
//        UserDefaults.standard.set(encodable: seting, forKey: "settingss")
//    }
//    
//    private func minus (seting: inout Settings, array: [String], number: inout Int, imageView: UIImageView) {
//        
//        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
//        
//        number -= 1
//        
//        if number <= 0 {
//            number = 0
//        }
//        
//        imageView.image = UIImage(named: array[number])
//        UserDefaults.standard.set(encodable: seting, forKey: "settingss")
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func plusSubmarine () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { print("return"); return }
        
        settings.numberSubmarine += 1
        
//        delegate?.addImage()
        
        if settings.numberSubmarine >= self.arraySubmarine.count {
            settings.numberSubmarine = self.arraySubmarine.count-1
        }
        
        print("Plus \(settings.numberSubmarine)")
        self.submarineImageView.image = UIImage(named: self.arraySubmarine[settings.numberSubmarine])
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
    }
    
    private func minusSubmarine () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberSubmarine -= 1
        
        if settings.numberSubmarine <= 0 {
            settings.numberSubmarine = 0
        }
        
        print("Minus \(settings.numberShark)")
        self.submarineImageView.image = UIImage(named: self.arraySubmarine[settings.numberSubmarine])
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    private func plusFihs () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { print("return"); return }
        
        settings.numberShark += 1
        
        if settings.numberShark >= self.arraySharks.count {
            settings.numberShark = self.arraySharks.count-1
        }
        
        print("Plus \(settings.numberShark)")
        self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
    }
    
    private func minusFish () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberShark -= 1
        
        if settings.numberShark <= 0 {
            settings.numberShark = 0
        }
        
        print("Minus \(settings.numberShark)")
        self.sharkImageView.image = UIImage(named: self.arraySharks[settings.numberShark])
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        
    }
    
    private func plusShip () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberShip += 1
        
        if settings.numberShip >= self.arrayShips.count {
            settings.numberShip = self.arrayShips.count-1
        }
        
        print("Plus \(settings.numberShip)")
        self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
    }
    
    private func minusShip () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberShip -= 1
        
        if settings.numberShip <= 0 {
            settings.numberShip = 0
        }
        
        print("Minus \(settings.numberShip)")
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        self.shipImageView.image = UIImage(named: self.arrayShips[settings.numberShip])
    }
    
    private func plusColor () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberColor += 1
        
        if settings.numberColor >= self.arrayColors.count {
            settings.numberColor = self.arrayColors.count-1
        }
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
    }
    
    private func minusColor () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberColor -= 1
        
        if settings.numberColor <= 0 {
            settings.numberColor = 0
        }
        
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        self.shildColorView.backgroundColor = self.arrayColors[settings.numberColor]
    }
    private func plusHardness () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberDifficultGame += 1
        
        if settings.numberDifficultGame >= self.arrayDifficulties.count {
            settings.numberDifficultGame = self.arrayDifficulties.count-1
        }
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
    }
    
    private func minusHardness () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        settings.numberDifficultGame -= 1
        
        if settings.numberDifficultGame <= 0 {
            settings.numberDifficultGame = 0
        }
        
        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
        self.difficultiesLabel.text = self.arrayDifficulties[settings.numberDifficultGame]
    }
    
    func addNameTextFild () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        if let text = self.nameTextField.first {
            if let textName = text.text {
                
               settings.name = textName
                self.nameLabel.text = settings.name
                UserDefaults.standard.set(encodable: settings, forKey: "settingss")
                
//                let sat = UserDefaults.standard.value(String.self, forKey: "settings")
                
                
                
            }
        }
    }
}
