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
        
//        let segmentControl = ALNSegmentControl(frame: CGRectMake(xMargin, 100, screenWidth - 2 * xMargin, 40))
        let segmentControl = ALNSegmentControl(frame: CGRectMake(xMargin, 100, screenWidth - 2 * xMargin, 40), titles: ["Objc","Swift","Apple","Google"])
        segmentControl.buttonClickedBlock = {(tag) in
            
            print("tag\(tag)")
        }
        
        let segmentControl2 = ALNSegmentControl(frame: CGRectMake(xMargin, 200, screenWidth - 2 * xMargin, 40), titles: ["Apple","Google","Facebook","Amazon"], withButtonClickedBlock: { (tag) -> Void in
            print("tag\(tag)")

        })
        
        self.view.addSubview(segmentControl)
        self.view.addSubview(segmentControl2)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

