//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Arsalaan Ali on 11/02/19.
//  Copyright © 2019 Arsalaan Ali. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBAction func close(){
        dismiss(animated: true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url){
                let baseURL = URL(fileURLWithPath:"Bundle.main.bundlePath")
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
