
import UIKit

//protocol StartGameViewControllerDelegate: AnyObject {
//    func addImage()
//}


class StartGameViewController: UIViewController {
    
    
//    weak var delegate: StartGameViewControllerDelegate?
    
    @IBOutlet weak var superSeaImageView: UIImageView!
    @IBOutlet weak var groundImageView: UIImageView!
    @IBOutlet weak var additionalSeaView: UIView!
    @IBOutlet weak var additionalSkyView: UIView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var arraySubmarine: [String] = []
    var arraySharks: [String] = []
    var arrayShips: [String] = []
    var arrayDifficulties: [String] = []
    var arrayColors: [UIColor] = []
    
    private var gameOverLabel = UILabel()
    private var setScoreLabel = UILabel()
    
    var restartButton = UIButton()
    var returnToMenueButton = UIButton()
    var tableRecordsButton = UIButton()
    
    var submarineShild = UIView()
    
    
    var submarineView = UIView()
    var submarineImageView = UIImageView()
    var healthView = UIProgressView()
    
    var ship = UIImageView()
    var fish = UIImageView()
    var octopus = UIImageView()
    var shild = UIImageView()
    
    var imageSubmarineShild = UIImageView()
    
    var scoreTimer: Timer = Timer()
    var timerFish = Timer()
    var timerShip = Timer()
    var timerHealth = Timer()
    var timerOctopus = Timer()
    var timerShild = Timer()
    
    var timerSubmarineShild = Timer()
    
    var contact: Bool = false
    var scoreCount: Int = 1
    var score: String = ""
    var date: String = ""
    
    var heightFish: CGFloat = 50
    var widthFish: CGFloat = 110
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restart()
        
    }
    
    
    
    
    @IBAction func moveUpButtonPressed(_ sender: UIButton) {
        
        guard self.checkCondition(self.submarineView) else { return }
        
        moveUp(y: &self.submarineView.frame.origin.y)
        moveUp(y: &self.submarineShild.frame.origin.y)
    }
    
    @IBAction func moveDownButtonPressed(_ sender: UIButton) {
        
        guard self.checkCondition(self.submarineView) else { return }
        moveDown(y: &self.submarineView.frame.origin.y)
        moveDown(y: &self.submarineShild.frame.origin.y)
    }
    
    @IBAction func changeHealth () {
        
        if self.submarineView.frame.intersects(self.additionalSkyView.frame) {
            self.healthView.progress = 1
        }
        
        if self.healthView.progress != 0 {
            self.healthView.progress -= 0.000025
            
        } else if self.healthView.progress == 0 {
            self.stopTimers()
        }
    }
    
    private func remove () {
        
        self.submarineView.removeFromSuperview()
        self.submarineShild.removeFromSuperview()
        self.ship.removeFromSuperview()
        self.fish.removeFromSuperview()
        self.octopus.removeFromSuperview()
        self.shild.removeFromSuperview()
    }
    
    private func restart () {
        
        self.addSubmarineView()
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        self.createImage(self.octopus, name: "octopus", x: 1500, y: 297, width: 130, height: 100)
        self.createImage(self.ship, name: arrayShips[settings.numberShip], x: self.view.frame.maxX + 200, y: self.additionalSeaView.frame.minY - 70, width: 200, height: 70)
        self.createImage(self.shild, name: "sfera1", x: self.view.frame.maxX+200, y: self.view.frame.midY, width: 20, height: 20)
        self.createFish()
        
        self.createTimer(&self.timerFish, self.timerFish, self.fish, 0.0048, 850, self.randomPosition)
        self.createTimer(&self.timerShip, self.timerShip, self.ship, 0.0065, 850, self.createConstantShipY)
        self.createTimer(&self.timerOctopus, self.timerOctopus, self.octopus, 0.0069, 1500, self.createConstantOctopusY)
        self.createTimerShild()
        self.createScoreTimer()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func addSubmarineViewTwo (x: CGFloat, y: CGFloat) {
        
        self.submarineView.frame = CGRect(x: x, y: y, width: 20, height: 20)
        
        self.view.addSubview(submarineView)
        submarineView.backgroundColor = .blue
        
        
        self.addSubmarineImageView()
        self.addHealth()
        
        self.timerHealth = Timer.scheduledTimer(timeInterval: 0.0003, target: self, selector: #selector(changeHealth), userInfo: nil, repeats: true)
        self.healthView.setProgress(1, animated: false)
    }
    
    
    private func addSubmarineView () {
        
        self.submarineView.frame = CGRect(x: 50, y: view.frame.midY, width: 20, height: 20)
        self.view.addSubview(submarineView)
        submarineView.backgroundColor = .blue
        
        self.addSubmarineImageView()
        self.addHealth()
        
        self.timerHealth = Timer.scheduledTimer(timeInterval: 0.0003, target: self, selector: #selector(changeHealth), userInfo: nil, repeats: true)
        self.healthView.setProgress(1, animated: false)
    }
    
    private func addSubmarineImageView () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        self.submarineView.addSubview(submarineImageView)
        self.submarineImageView.image = UIImage(named: self.arraySubmarine[settings.numberSubmarine])
        
        self.submarineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.submarineImageView.leftAnchor.constraint(equalTo: submarineView.leftAnchor, constant: -20).isActive = true
        self.submarineImageView.rightAnchor.constraint(equalTo: submarineView.rightAnchor, constant: 20).isActive = true
        self.submarineImageView.topAnchor.constraint(equalTo: submarineView.topAnchor, constant: -20).isActive = true
        self.submarineImageView.bottomAnchor.constraint(equalTo: submarineView.bottomAnchor, constant: 20).isActive = true
    }
    
    private func addHealth () {
        
        self.healthView.progressTintColor = UIColor.green
        self.healthView.trackTintColor = UIColor.gray
        
        self.submarineView.addSubview(healthView)
        self.healthView.translatesAutoresizingMaskIntoConstraints = false
        
        self.healthView.leftAnchor.constraint(equalTo: submarineView.leftAnchor, constant: -27).isActive = true
        self.healthView.rightAnchor.constraint(equalTo: submarineView.rightAnchor, constant: 27).isActive = true
        
        self.healthView.centerXAnchor.constraint(equalTo: submarineView.centerXAnchor).isActive = true
        self.healthView.topAnchor.constraint(equalTo: submarineView.topAnchor, constant: -20).isActive = true
        self.healthView.heightAnchor.constraint(equalTo: submarineView.heightAnchor, multiplier: 1/10).isActive = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func moveUp (y: inout CGFloat) {
        
        guard y > self.additionalSkyView.frame.maxY else { return }
        y -= 20
    }
    private func moveDown (y: inout CGFloat) {
        
        guard y < self.groundImageView.frame.minY else { return }
        y += 20
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func createTestView () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        self.submarineShild = UIView(frame: CGRect(x: self.submarineView.frame.minX-20,
                                                   y: self.submarineView.frame.minY-15,
                                                   width: 60, height: 60))
        self.view.addSubview(submarineShild)
        self.submarineShild.layer.cornerRadius = self.submarineShild.frame.width/2
        self.submarineShild.backgroundColor = arrayColors[settings.numberColor]
        
        self.createTestImageView()
    }
    
    
    private func createTestImageView () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        self.submarineShild.addSubview(self.imageSubmarineShild)
        self.imageSubmarineShild.addConstraint(submarineShild)
        self.imageSubmarineShild.image = UIImage(named: arraySubmarine[settings.numberSubmarine])
    }
    
    
    private func createTimerShild () {
        
        self.timerShild = Timer.scheduledTimer(withTimeInterval: 0.0065, repeats: true, block: { (_) in
            
            self.shild.frame.origin.x -= 1
            
            if self.shild.frame.origin.x == -200 {
                self.shild.frame.origin.x = 4000
                self.shild.frame.origin.y = self.randomPosition()
            }
            
            if self.submarineView.frame.intersects(self.shild.frame) {
                
                self.shild.frame.origin.x = 10000
                self.shild.frame.origin.y = self.randomPosition()
                
                self.contact = true
                print("true")
                
                self.createTestView()
                
                self.submarineView.removeFromSuperview()
                self.healthView.removeFromSuperview()
                self.timerHealth.invalidate()
                
                self.timerSubmarineShild = Timer.scheduledTimer(withTimeInterval: 20, repeats: false, block: { (_) in
                    
                    self.contact = false
                    print("false")
                    
                    self.submarineShild.removeFromSuperview()
                    self.timerSubmarineShild.invalidate()
                    self.addSubmarineViewTwo(x: self.submarineShild.frame.midX, y: self.submarineShild.frame.midY)
                })
            }
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func createFish () {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return }
        
        self.fish = UIImageView(frame: CGRect(x: 850, y: self.randomPosition(), width: self.widthFish, height:self.heightFish))
        self.view.addSubview(self.fish)
        self.fish.image = UIImage(named: arraySharks[settings.numberShark])
    }
    private func createImage (_ imageView: UIImageView, name: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        
        imageView.frame =  CGRect(x: x, y: y, width: width, height: height)
        
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: name)
    }
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    // "DEFEAT FUNC" func witch stop all process and add alert with choose next step
    private func stopTimers () {
        
        self.timerShip.invalidate()
        self.timerFish.invalidate()
        self.timerOctopus.invalidate()
        self.timerHealth.invalidate()
        self.timerShild.invalidate()
        self.scoreTimer.invalidate()
        self.scoreCount = 1
        
        self.saveRecords()
        
//        self.createDate()
//        self.addScore()
        
        
        addDefaultAlert(title: "Game over", message: "You are loose", defaultTitle: "Restart", cancelTitle: "Return menue", destractiveTitle: "Table Records", okAction: {
            
            self.remove()
            self.restart()
            
        }, cancelAction: {
            self.navigationController?.popToRootViewController(animated: true)
        }) {
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableRecordsViewController") as? TableRecordsViewController else { return }
            
//            self.delegate?.addImage()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
    
    private func checkCondition(_ view: UIView) -> Bool {
        
        if view.frame.intersects(self.fish.frame) ||
            view.frame.intersects(self.ship.frame) ||
            view.frame.intersects(self.groundImageView.frame) ||
            view.frame.intersects(self.octopus.frame) {
            
            return false } else { return true }
    }
    
    
    
    
    
    
    
    //  func witch start time of score time
    private func createScoreTimer () {
        
        self.scoreTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { (_) in
            self.scoreCount += 1
            
            let time = self.secondsToHoursMinutesSeconds(seconds: self.scoreCount)
            self.score = self.makeTimeString(houres: time.0, minutes: time.1)
            
            self.scoreLabel.text = self.score
        })
        
    }
    private func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int) {
        
        return (((seconds / 60000) % 60), ((seconds / 1000) % 60))
    }
    
    
    private func makeTimeString(houres: Int, minutes: Int) -> String {
        
        var timeString = ""
        timeString += String(format: "%02d", houres)
        timeString += " : "
        
        timeString += String(format: "%02d", minutes)
        return timeString
    }
    
    
    
    
    
    
    
    private func createTimer ( _ timer: inout Timer, _ timerTwo: Timer, _ imageOne: UIImageView, _ time: Double, _ coordinateX: CGFloat, _ coordinateY: @escaping () -> CGFloat) {
        
        
        
        timer = Timer.scheduledTimer(withTimeInterval: self.useDificulties(time: time), repeats: true, block: { (_) in
            
            imageOne.frame.origin.x -= 1
            
            if imageOne.frame.origin.x == -300 {
                
                imageOne.frame.origin.x = coordinateX
                imageOne.frame.origin.y = coordinateY()
                
            } else if imageOne.frame.intersects(self.submarineView.frame) && self.contact == true {
                
                imageOne.frame.origin.x = coordinateX
                imageOne.frame.origin.y = coordinateY()
                
            } else if imageOne.frame.intersects(self.submarineView.frame) && self.contact == false {
                
                self.stopTimers()
            }
        })
    }
    
    
    
    
    // func dificulties game
    private func useDificulties (time: Double) -> Double {
        
        guard let settings = UserDefaults.standard.value(Settings.self, forKey: "settingss") else { return time }
        
        switch settings.numberDifficultGame {
        case 0:
            return time
        case 1:
            let caseTime = time - 0.0005
            return caseTime
        case 2:
            let caseTime = time - 0.001
            return caseTime
        case 3:
            let caseTime = time - 0.0015
            return caseTime
        case 4:
            let caseTime = time - 0.002
            return caseTime
        default:
            return time
        }
        
    }
    
   
    
    
    
    func saveRecords()  {
      
        let date = Date()
        let formater = DateFormatter()
        
        formater.dateFormat = "d MMM yyyy HH:mm:ss"
        self.date = formater.string(from: date)
       
        if UserDefaults.standard.value(Record.self, forKey: "records") == nil {

            let startWrite =  self.score
            let defaultDate = self.date

            let record = Record(score: [startWrite], rightful: false, arrayDate: [defaultDate])
            UserDefaults.standard.set(encodable: record, forKey: "records")


        }  else {
            guard let record = UserDefaults.standard.value(Record.self, forKey: "records") else { return }

            record.score.append(self.score)
            record.arrayDate.append(self.date) // from func createScoreTimer
            UserDefaults.standard.set(encodable: record, forKey: "records")
        }
    }
    
    
    
        
        
        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func createConstantShipY () -> CGFloat {
        let coordinate = self.additionalSeaView.frame.minY - 70
        return coordinate
    }
    
    private func createConstantOctopusY () -> CGFloat {
        let coordinate: CGFloat = 297
        return coordinate
    }
    
    private func randomPosition() -> CGFloat {
        
        let randomPosition = CGFloat(findRandomY (
            
            maxNum: UInt32(self.groundImageView.frame.minY - self.heightFish/2),
            minNum: UInt32(self.additionalSkyView.frame.maxY + self.heightFish/2)))
        return randomPosition
    }
    private func findRandomY (maxNum: UInt32, minNum: UInt32) -> UInt32 {
        let rand = arc4random_uniform((maxNum-minNum) + 1) + minNum
        return rand
    }
}





















































