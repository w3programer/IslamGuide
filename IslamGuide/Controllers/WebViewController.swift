
import UIKit
import  WebKit
class WebViewController: UIViewController {
    @IBOutlet var Webkitview: WKWebView!
    var urlstr:ReadMoreStruct?
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: (urlstr?.link)!)
        print(url ?? "no url passed")
        let request = URLRequest(url: url! )
        Webkitview.load(request)
  
    }
  
}
