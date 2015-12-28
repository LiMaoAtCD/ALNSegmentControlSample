//
//  ViewController.swift
//  ALNSegmentControlSample
//
//  Created by AlienLi on 15/12/28.
//  Copyright © 2015年 MarcoLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let xMargin: CGFloat = 30.0
        
        let segmentControl = ALNSegmentControl(frame: CGRectMake(xMargin, 100, screenWidth - 2 * xMargin, 40))
        segmentControl.titles = ["Objc","Swift","Apple","Google"]
        segmentControl.buttonClickedBlock = {(tag) in
            
            print("tag\(tag)")
        }
        
        self.view.addSubview(segmentControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

