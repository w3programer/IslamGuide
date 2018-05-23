
import UIKit
class ViewController: UIViewController {    
    var destnationtypeid :Int?
    override func viewDidLoad() {
        super.viewDidLoad()  
    }

    @IBAction func Summary(_ sender: UIButton) {
        destnationtypeid = 4
        performSegue(withIdentifier: "ShowLaunageSegue", sender: self)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func DetailedCall(_ sender: UIButton) {
        destnationtypeid = 5
        performSegue(withIdentifier: "ShowLaunageSegue", sender: self)
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func Other(_ sender: UIButton) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowLaunageSegue" {
            let destinationVC = segue.destination as! LaunageVcViewController
            destinationVC.destnationtype = destnationtypeid!
            
        }
        
        
    }
    
    
}

