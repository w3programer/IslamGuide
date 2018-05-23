
import UIKit
class LaunageVcViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
   //fileprivate let cellIdentifier = "TaskCell"
    //fileprivate let cellHight :CGFloat = 100.0
    var destnationtype:Int?
    @IBOutlet var Launagetable: UITableView!
     var launages = [Launages]()
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handlerefresh), for: .valueChanged)
        return refresher
    }()
    override func viewDidLoad() {
        navigationItem.title = NSLocalizedString("launages", comment: "changae launages")
        super.viewDidLoad()
        let CellNib = UINib(nibName: "LaunageTableViewCell", bundle:nil)
        self.Launagetable.register(CellNib, forCellReuseIdentifier: "LaunageCell")
        Launagetable.tableFooterView = UIView()
         Launagetable.addSubview(refresher)
        Launagetable.dataSource  = self
        Launagetable.delegate  = self

        handlerefresh()
        // Launagetable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        //Launagetable.separatorInset = .zero
        // Launagetable.contentInset = .zero

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaunageCell" ,for: indexPath) as! LaunageTableViewCell
        cell.LaunageLable.text = launages[indexPath.row].name
        let urlString = Urls.main+launages[indexPath.row].flag
        let url = URL(string: urlString )
        cell.FlagImage.downloadedFrom(url: url!)
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ReadMoreSegue", sender: self)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ReadMoreSegue" {
            let destinationVC = segue.destination as! ReadMoreViewController
            destinationVC.selectedlan = launages[(Launagetable.indexPathForSelectedRow?.row)!]
            destinationVC.type = destnationtype!
            
        }
        
        
    }
    
    
    

   @objc private func handlerefresh(){
    self.refresher.endRefreshing()
        Api.launages{(error :Error?, lang: [Launages]?) in
            self.launages = lang!
            self.Launagetable.reloadData()
        
    }
    }
    


}
/*extension LaunageVcViewController: UITableViewDataSource{
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return launages.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "LaunageCell" ,for: indexPath) as! LaunageTableViewCell
 cell.LaunageLable.text = launages[indexPath.row].name
 let urlString = Urls.main+launages[indexPath.row].flag
 let url = URL(string: urlString )
 cell.FlagImage.downloadedFrom(url: url!)
 return cell
 
 }
 
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 self.performSegue(withIdentifier: "WebViewSegue", sender: self)
 
 }
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
 if segue.identifier == "WebViewSegue" {
 let destinationVC = segue.destination as! WebViewController
 destinationVC.selectedlan = launages[(Launagetable.indexPathForSelectedRow?.row)!]
 destinationVC.type = destnationtype!
 
 }
 
 
 }
 
 
 

}*/
/*
extension LaunageVcViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
 */
   /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHight
 }
 
 }
    */








