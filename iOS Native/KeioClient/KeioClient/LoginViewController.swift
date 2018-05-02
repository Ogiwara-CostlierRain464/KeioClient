import UIKit
import WebKit
import Alamofire
import Runes
import Curry

class LoginViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var web: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        web.load(URLRequest(url: URL(string: Url.Portal.rawValue)!))
        web.navigationDelegate = self
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        guard let url = webView.url else {
            return
        }
        
        if url.absoluteString == Url.Portal.rawValue {
            WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
                let mapedCookies = cookies.map { cookie in
                    return Cookie(name: cookie.name, value: cookie.value)
                }
                
                let jsonString = String(data: try! JSONEncoder().encode(mapedCookies), encoding: .utf8)
                
                Alamofire.request(Url.LocalWrapper.rawValue, method: .post, parameters: ["cookie": jsonString])
                
                //back to home
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
