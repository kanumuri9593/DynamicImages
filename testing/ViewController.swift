//
//  ViewController.swift
//  testing
//
//  Created by Yeswanth Kanumuri on 9/15/16.
//  Copyright © 2016 Yeswanth Kanumuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapAction(_:)))
        
        self.imageView.userInteractionEnabled = true
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tapAction(sender: UITapGestureRecognizer) {
        
        let touchPoint = sender.locationInView(self.imageView) // Change to whatever view you want the point for
     
        let co = imageView.getColourFromPoint(touchPoint)
        print(touchPoint)
        print(co.hexString)
    }
    

    @IBAction func qwer(sender: AnyObject) {
        print(" employee tap")
    }
    @IBAction func ex(sender: AnyObject) {
        print(" sheild tap")
    }
    @IBAction func fingerprint(sender: AnyObject) {
         print("finger prnt tapped")
    }
    @IBAction func log(sender: AnyObject) {
        print("logo tapped")
    }
    @IBOutlet weak var fingertapped: SOXShapedTapButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var logotapped: SOXShapedTapButton!

}


