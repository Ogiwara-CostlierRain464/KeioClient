import UIKit
import WebKit
import Alamofire
import Runes
import Curry

class LoginViewController: UIViewController, WKNavigationDelegate {
    
    let web = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        web.load(URLRequest(url: URL(string: Url.realPortal.rawValue)!))
        web.navigationDelegate = self
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        
        
        if url.absoluteString.contains(Url.realOAuth.rawValue){
            tryToLogin()
        }
        
        if url.absoluteString.contains(Url.realPortal.rawValue){
            storeCookieAndBackToHame()
        }
    }
    
    // TODO - Read from DB
    private func tryToLogin(){
        web.evaluateJavaScript(
            """
form = document.forms.login;
form.j_username.value = "MAIL";
form.j_password.value = "PASS";
login = document.getElementsByName("_eventId_proceed")[0];
login.click();
""")
    }
    
    private func storeCookieAndBackToHame(){
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
            let mapedCookies = cookies.map { cookie in
                return Cookie(name: cookie.name, value: cookie.value)
            }
            
            let jsonString = String(data: try! JSONEncoder().encode(mapedCookies), encoding: .utf8)
            
            //print("Cookie: \(String(describing: jsonString))")
            
            self.saveCookieAndreturnToHome(mapedCookies)
        }
    }
    
    func saveCookieAndreturnToHome(_ cookies: [Cookie]){
        //CookieRepository.shared.cookies = cookies
        self.dismiss(animated: true, completion: nil)
    }
}
