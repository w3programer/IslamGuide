
import UIKit
class ReadMoreViewController: UIViewController ,UITableViewDelegate ,
    UITableViewDataSource {
    @IBOutlet var TableView: UITableView!
   
    var selectedlan:Launages?
    var type:Int = 0
    var tabledata = [ReadMoreStruct]()
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handlerefresh), for: .valueChanged)
        return refresher
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("detailes", comment: "detailes")
        let launageid = selectedlan?.id
        let urlstr =  Urls.main+"api/getLanguage?id=\(launageid!)&type=\(type)"
        print(urlstr)
        TableView.tableFooterView = UIView()
        TableView.addSubview(refresher)
         handlerefresh(url: urlstr)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabledata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReadMoreCell" ,for: indexPath) as! ReadMoreTableViewCell
           cell.AdressLable?.text = tabledata[indexPath.row].address
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "WebViewSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "WebViewSegue" {
            let destinationVC = segue.destination as! WebViewController
            destinationVC.urlstr = tabledata[(TableView.indexPathForSelectedRow?.row)!]
        } 
    }
    
    @objc func handlerefresh(url:String){
        self.refresher.endRefreshing()
        Api.ReadMoreApi(url) { (error: Error?, ResultData:[ReadMoreStruct]?) in
            self.tabledata = ResultData!
            self.TableView.reloadData()
        }
        
    }
}
