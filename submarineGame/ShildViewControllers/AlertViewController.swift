

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var superSeaImageView: UIImageView!
    @IBOutlet weak var groundImageView: UIImageView!
    @IBOutlet weak var additionalSeaView: UIView!
    @IBOutlet weak var additionalSkyView: UIView!
    
    @IBOutlet weak var scoreLabel: UILabel!
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
    
    
    var heightFish: CGFloat = 50
    var widthFish: CGFloat = 110
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSubmarineView()
        
        self.createImage(self.octopus, name: "octopus", x: 1500, y: 297, width: 130, height: 100)
        self.createImage(self.ship, name: "yacht", x: self.view.frame.maxX + 200, y: self.additionalSeaView.frame.minY - 70, width: 200, height: 70)
        self.createImage(self.shild, name: "sfera1", x: self.view.frame.maxX+200, y: self.view.frame.midY, width: 20, height: 20)
        self.createFish()
        
        
        self.createTimer(&self.timerFish, self.timerFish, self.fish, 0.003, 850, self.randomPosition)
        self.createTimer(&self.timerShip, self.timerShip, self.ship, 0.005, 850, self.createConstantShipY)
        self.createTimer(&self.timerOctopus, self.timerOctopus, self.octopus, 0.01, 1500, self.createConstantOctopusY)
        self.createTimerShild()
        self.createScoreTimer()
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
    
    func addSubmarineViewTwo (x: CGFloat, y: CGFloat) {
        
        self.submarineView.frame = CGRect(x: x, y: y, width: 20, height: 20)
        
        self.view.addSubview(submarineView)
        submarineView.backgroundColor = .blue
        
        
        self.addSubmarineImageView()
        self.addHealth()
        
        self.timerHealth = Timer.scheduledTimer(timeInterval: 0.0003, target: self, selector: #selector(changeHealth), userInfo: nil, repeats: true)
        self.healthView.setProgress(1, animated: false)
    }
    
    
    func addSubmarineView () {
        
        self.submarineView.frame = CGRect(x: 50, y: view.frame.midY, width: 20, height: 20)
        self.view.addSubview(submarineView)
        submarineView.backgroundColor = .blue
        
        self.addSubmarineImageView()
        self.addHealth()
        
        self.timerHealth = Timer.scheduledTimer(timeInterval: 0.0003, target: self, selector: #selector(changeHealth), userInfo: nil, repeats: true)
        self.healthView.setProgress(1, animated: false)
    }
    
    func addSubmarineImageView () {
        
        self.submarineView.addSubview(submarineImageView)
        self.submarineImageView.image = UIImage(named: "submarine3")
        
        self.submarineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.submarineImageView.leftAnchor.constraint(equalTo: submarineView.leftAnchor, constant: -20).isActive = true
        self.submarineImageView.rightAnchor.constraint(equalTo: submarineView.rightAnchor, constant: 20).isActive = true
        self.submarineImageView.topAnchor.constraint(equalTo: submarineView.topAnchor, constant: -20).isActive = true
        self.submarineImageView.bottomAnchor.constraint(equalTo: submarineView.bottomAnchor, constant: 20).isActive = true
    }
    
    func addHealth () {
        
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func moveUp (y: inout CGFloat) {
        
        guard y > self.additionalSkyView.frame.maxY else { return }
        y -= 20
    }
    func moveDown (y: inout CGFloat) {
        
        guard y < self.groundImageView.frame.minY else { return }
        y += 20
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func createTestView () {
        
        self.submarineShild = UIView(frame: CGRect(x: self.submarineView.frame.minX-20,
                                                   y: self.submarineView.frame.minY-15,
                                                   width: 60, height: 60))
        self.view.addSubview(submarineShild)
        self.submarineShild.layer.cornerRadius = self.submarineShild.frame.width/2
        self.submarineShild.backgroundColor = .blue
        
        self.createTestImageView()
    }
    
    
    func createTestImageView () {
        
        self.submarineShild.addSubview(self.imageSubmarineShild)
        self.imageSubmarineShild.addConstraint(submarineShild)
        self.imageSubmarineShild.image = UIImage(named: "submarine3")
    }
    
    
    func createTimerShild () {
        
        self.timerShild = Timer.scheduledTimer(withTimeInterval: 0.003, repeats: true, block: { (_) in
            
            self.shild.frame.origin.x -= 1
            
            if self.shild.frame.origin.x == -200 {
                self.shild.frame.origin.x = 850
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func createFish () {
        
        self.fish = UIImageView(frame: CGRect(x: 850, y: self.randomPosition(), width: self.widthFish, height:self.heightFish))
        
        self.view.addSubview(self.fish)
        self.fish.image = UIImage(named: "shark")
    }
    func createImage (_ imageView: UIImageView, name: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        
        imageView.frame =  CGRect(x: x, y: y, width: width, height: height)
        
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: name)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func stopTimers () {
        
        self.timerShip.invalidate()
        self.timerFish.invalidate()
        self.timerOctopus.invalidate()
        self.timerHealth.invalidate()
        self.timerShild.invalidate()
        self.scoreTimer.invalidate()
    }
    
    func checkCondition(_ view: UIView) -> Bool {
        
        if view.frame.intersects(self.fish.frame) ||
            view.frame.intersects(self.ship.frame) ||
            view.frame.intersects(self.groundImageView.frame) ||
            view.frame.intersects(self.octopus.frame) {
            
            return false } else { return true }
    }
    
    
    
    
    
    
    private func createScoreTimer () {
        
        self.scoreTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { (_) in
            self.scoreCount += 1
            
            let time = self.secondsToHoursMinutesSeconds(seconds: self.scoreCount)
            let timeString = self.makeTimeString(houres: time.0, minutes: time.1)
            
            self.scoreLabel.text = timeString
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
        
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true, block: { (_) in
            
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
