

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
  
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    func configure (text: String, data: String) {
        if recordLabel.text == nil && dataLabel.text == nil {
            
            recordLabel.text = "00:00"
            dataLabel.text = "time"
        } else {
        recordLabel.text = text
        dataLabel.text = data
    }

    }
    
}
