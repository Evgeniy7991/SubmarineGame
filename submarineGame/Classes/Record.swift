
import Foundation

class Record: Codable {
    
    
    
    var score: [String]
    var arrayDate: [String]
    var rightful: Bool
    
    init(score: [String], rightful: Bool, arrayDate: [String] ) {
        self.score = score
        self.rightful = rightful
        self.arrayDate = arrayDate
    }
    
    
    enum CodingKeys: String, CodingKey {
        case score, rightful, arrayDate
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.score = try container.decode([String].self, forKey: .score)
        self.rightful = try container.decode(Bool.self, forKey: .rightful)
        self.arrayDate = try container.decode([String].self, forKey: .arrayDate)
       
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.score, forKey: .score)
        try container.encode(self.rightful, forKey: .rightful)
        try container.encode(self.arrayDate, forKey: .arrayDate)
    }
    
    
}
