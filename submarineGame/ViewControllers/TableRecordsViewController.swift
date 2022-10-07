




import UIKit


class TableRecordsViewController: UIViewController {
    
    
    @IBOutlet weak var tableRecord: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDetected))
        
        rightSwipeRecognizer.direction = .right
        self.view.addGestureRecognizer(rightSwipeRecognizer)
        
        
        //        if let record = UserDefaults.standard.value(Record.self, forKey: "records") {
        //
        //            for value in record.score {
        //                self.lableRecords.text = self.lableRecords.text! + " - \(value)"
        //            }
        //
        //            for date in record.arrayDate {
        //                self.labelDate.text = self.labelDate.text! + " - \(date)"
        //            }
        //        }
        
        
        
        
        
        
        
        
    }
    
    @IBAction func rightSwipeDetected () {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    
    
    
}
extension TableRecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let record = UserDefaults.standard.value(Record.self, forKey: "records") else { return 1 }
        return record.score.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        guard let record = UserDefaults.standard.value(Record.self, forKey: "records") else {
            
            
            let cellView = UITableViewCell()
            
            cellView.isHidden = true
//            cellView.contentView.backgroundColor = .green
            return cellView }
            
            
        
        
        cell.configure(text: record.score[indexPath.row], data: record.arrayDate[indexPath.row])
        
        return cell
    }
}
