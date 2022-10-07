

import Foundation


class Settings: Codable {
    
    var numberColor: Int
    var numberShark: Int
    var numberShip: Int
    var numberSubmarine: Int
    
    var numberDifficultGame: Int
    var name = ""
    
    init(numberColor: Int, numberShark: Int, numberShip: Int, numberDifficultGame: Int, name: String, numberSubmarine: Int) {
        
        self.numberSubmarine = numberSubmarine
        self.numberColor = numberColor
        self.numberShark = numberShark
        self.numberShip = numberShip
        self.numberDifficultGame = numberDifficultGame
        self.name = name
        
    }
    
    
    enum CodingKeys: String, CodingKey {
        case numberColor,  numberShark, numberShip, numberSubmarine ,numberDifficultGame, name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.numberSubmarine = try container.decode(Int.self, forKey: .numberSubmarine)
        self.numberColor = try container.decode(Int.self, forKey: .numberColor)
        self.numberShark = try container.decode(Int.self, forKey: .numberShark)
        self.numberShip = try container.decode(Int.self, forKey: .numberShip)
        self.numberDifficultGame = try container.decode(Int.self, forKey: .numberDifficultGame)
        self.name = try container.decode(String.self, forKey: .name)
       
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.numberSubmarine, forKey: .numberSubmarine)
        try container.encode(self.numberColor, forKey: .numberColor)
        try container.encode(self.numberShark, forKey: .numberShark)
        try container.encode(self.numberShip, forKey: .numberShip)
        try container.encode(self.numberDifficultGame, forKey: .numberDifficultGame)
        try container.encode(self.name, forKey: .name)
        
    }
    
    
}
