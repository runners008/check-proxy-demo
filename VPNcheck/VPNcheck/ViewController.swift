import UIKit
import CoreTelephony

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Proxy active: \(checkIsProxy())"
    }
    
    @IBAction func didTap(_ sender: Any) {
        label.text = "Proxy active: \(checkIsProxy())"
    }
    
    func checkIsProxy() -> Bool {
        guard
            let proxySettingsUnmanaged = CFNetworkCopySystemProxySettings(),
            let proxySettings = proxySettingsUnmanaged.takeRetainedValue() as? [String: Any]
        else { return false }
        
        return (proxySettings["HTTPProxy"] != nil || proxySettings["HTTPSProxy"] != nil)
    }
}

