import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if notLogined() {
            performSegue(withIdentifier: "segue_login", sender: nil)
        }
    }

    private func notLogined()-> Bool{
        return true
    }
}
