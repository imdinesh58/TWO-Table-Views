
import UIKit


class MediaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblView2: UITableView!
    @IBOutlet weak var searchBar2: UITextField!
    
    var table1Data:[String] = []
    var table2Data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate =  self
        tblView.dataSource = self
        tblView2.delegate =  self
        tblView2.dataSource = self
    }
    
    @IBAction func Addd() {
        table1Data.append(searchBar.text!)
        table2Data.append(searchBar2.text!)
        DispatchQueue.main.async {
            //reload your tableView
            self.tblView.reloadData()
            self.tblView2.reloadData()
        }
        //searchBar.resignFirstResponder()
        //searchBar2.resignFirstResponder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblView {
            return table1Data.count
        } else if tableView == tblView2 {
            return table2Data.count
        }
        return Int()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if tableView == tblView {
            let cell = tblView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            let row = indexPath.row
            cell.textLabel?.text = table1Data[row]
            return cell
        } else if tableView == tblView2 {
            let cell = tblView2.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            let row = indexPath.row
            cell.textLabel?.text = table2Data[row]
            return cell
        }
        return UITableViewCell()
    }

    
}
