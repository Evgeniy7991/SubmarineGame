

import UIKit

class CustomTabelViewController: UIViewController {

    @IBOutlet weak var tableRecords: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

extension CustomTabelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let record = UserDefaults.standard.value(Record.self, forKey: "records") else { return 1 }
        return record.score.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            
            let cellView = UITableViewCell()
            cellView.contentView.backgroundColor = .green
            return cellView }
        
        return cell
    }
    
    
}
