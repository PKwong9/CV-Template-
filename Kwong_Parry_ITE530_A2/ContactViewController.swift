import Foundation
import UIKit
import MessageUI

class ContactViewController: UIViewController, UIWebViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set webview's delegate and attempt to load URL
        webView.delegate = self
        let url = NSURL (string: "https://hk.linkedin.com/in/parry-kwong-a32655b6")!
        let requestObj = URLRequest(url: url as URL)
        webView.loadRequest(requestObj as URLRequest)
        
    }
    
    @IBAction func phoneCallButtonTapped(_ sender: Any) { //calls number and shows Error if fail
        
        let url = NSURL(string: "tel://25671528")!
        
        switch (UIApplication.shared.canOpenURL(url as URL)) {
        case (true):
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        case (false):
            self.showErrorAlert(title: "Could not call", message: "Your device could not call number.  Please check phone configuration and try again.")
        }
    }
    
    @IBAction func sendEmailButtonTapped(_ sender: Any) { //checks to see if system can send email and composes email, shows Error is fail

        let mailComposeViewController = configuredMailComposeViewController()
        
        switch(MFMailComposeViewController.canSendMail()) {
        case (true):
            self.present(mailComposeViewController, animated: true, completion: nil)
        case(false):
            self.showErrorAlert(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.")
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController { //configurations for email
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["parrykwong9@gmail.com"])
        mailComposerVC.setSubject(" ")
        
        return mailComposerVC
    }
    
    func showErrorAlert(title: String, message: String){ //error and alert display
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: UIWebViewDelegate
    
    func webViewDidStartLoad(_ webView: UIWebView){
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) { //Error Handling for loading webview
        self.showErrorAlert(title: "Network Connection", message: "Could not load webpage. Please check network configuration and try again.")
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
}
