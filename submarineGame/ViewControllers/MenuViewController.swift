

import UIKit

class MenuViewController: UIViewController {
    

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var tableRecordsButton: UIButton!
    
    var arraySharks = ["shark","shark2","shark3","shark4","shark5","shark6","shark7",]
    var arrayShips = ["yacht", "yacht2", "yacht3"]
    var arrayDifficulties = [ "verylight", "light", "medium", "hard", "extrim" ]
    var arraySubmarine = [
        
        "submarine3",
        "submarine4",
        "submarine5",
        "submarine6",
        "submarine7",
        "submarine8",
        "submarine9",
        "submarine10",
        "submarine11",
        "submarine12",
        "submarine13"
    ]
    
    
    var string = ""
    
    
    var arrayColors = [
        
        UIColor.black,
        UIColor.blue,
        UIColor.brown,
        UIColor.cyan,
        UIColor.green,
        UIColor.magenta,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.yellow,
        UIColor.white
    ]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        resetDefaults()
        self.addAlertName()

        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        self.nameLabel.text = settings.name
        
      
        
//        for family: String in UIFont.familyNames {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family) {
//                print("==\(names)")
//            }
//        }
        
        let font = UIFont(name: "GreatVibes-Regular", size: 28)
        
        self.startGameButton.titleLabel?.font = font
        self.settingsButton.titleLabel?.font = font
        self.tableRecordsButton.titleLabel?.font = font
        
        self.startGameButton.rounded()
        self.settingsButton.rounded()
        self.tableRecordsButton.rounded()
        
        self.startGameButton.dropShadow()
        self.settingsButton.dropShadow()
        self.tableRecordsButton.dropShadow()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        self.nameLabel.text = settings.name
    }
    
    
   
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "StartGameViewController") as! StartGameViewController
        
        controller.arraySubmarine = self.arraySubmarine
        controller.arraySharks = self.arraySharks
        controller.arrayShips = self.arrayShips
        controller.arrayColors = self.arrayColors
        controller.arrayDifficulties = self.arrayDifficulties
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func openSettingsButtonPressed(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        controller.arraySubmarine = self.arraySubmarine
        controller.arraySharks = self.arraySharks
        controller.arrayShips = self.arrayShips
        controller.arrayColors = self.arrayColors
        controller.arrayDifficulties = self.arrayDifficulties
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func openTableRecordsButtonPressed(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableRecordsViewController") as! TableRecordsViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    
    
    
    
    
    private func addAlertName () {
        
        if UserDefaults.standard.value(Settings.self, forKey: "settingss") == nil {
        
            let set = Settings(numberColor: 0, numberShark: 0, numberShip: 0, numberDifficultGame: 0, name: "Your name", numberSubmarine: 0)
            UserDefaults.standard.set(encodable: set, forKey: "settingss")
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
            self.nameLabel.text = settings.name
            
            let alert = UIAlertController(title: "Hello a new Captain!", message: "Please enter yor name", preferredStyle: .alert)
            let enterName = UIAlertAction(title: "Enter", style: .default) { (_) in
                
                if let text = alert.textFields?.first {
                    if let textName = text.text {
                        settings.name = textName
                        self.nameLabel.text = textName
                        UserDefaults.standard.set(encodable: settings, forKey: "settingss")
                    }
                }
            }
        alert.addAction(enterName)
        alert.addTextField(configurationHandler: nil)
        present(alert, animated: true, completion: nil)
        
        } else {
            
            guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
            self.nameLabel.text = settings.name
            
        }
    }
}

