//
//  ALNSegmentControl.swift
//  ALNSegmentControlSample
//
//  Created by AlienLi on 15/12/28.
//  Copyright © 2015年 MarcoLi. All rights reserved.
//

import UIKit
typealias ButtonClickedBlock = (tag: Int) -> Void

class ALNSegmentControl: UIView {
    
    var titles: [String]!
    var titleNormalColor: UIColor = UIColor.blackColor()
    var titleHighlightColor: UIColor = UIColor.whiteColor()
    var highlightBackgroundColor: UIColor = UIColor.redColor()
    var titlesFont: UIFont = UIFont.systemFontOfSize(20.0)
    var duration: NSTimeInterval = 0.3
    
    private var viewWidth: CGFloat = 0.0
    private var viewHeight: CGFloat = 0.0
    private var labelWidth: CGFloat {
        let width = viewWidth / CGFloat(titles.count)
        return width
    }

    private var highlightView: UIView?
    private var highlightTopView: UIView?
    private var highlightColorView: UIView?

    lazy private var labels: [UILabel] = {
        var array: [UILabel] = [UILabel]()
        return array
    }()
    
    var buttonClickedBlock: ButtonClickedBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewWidth = frame.size.width
        self.viewHeight = frame.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        return self.init(coder: aDecoder)
    }
    
    
    override func layoutSubviews() {

        guard let _ = titles else{
            assert(titles != nil, "titles can't be nil")
            return
        }
        
        createBottomLabels()
        createTopLabels()
        createTopButtons()
    }
    
    func createBottomLabels() {
    
        let count = self.titles.count
        for (var i = 0 ; i < count; i++) {
            let label = createLabelByTitleIndex(i, textColor: titleNormalColor)
            self.addSubview(label)
            self.labels.append(label)
        }
    }
    
    func createTopLabels() {
        let highlightViewFrame = CGRectMake(0, 0, labelWidth, viewHeight)
        highlightView = UIView(frame: highlightViewFrame)
        highlightView?.clipsToBounds = true
        
        highlightColorView = UIView(frame: highlightViewFrame)
        highlightColorView?.backgroundColor = highlightBackgroundColor
        highlightColorView?.layer.cornerRadius = 20.0
        highlightView?.addSubview(highlightColorView!)
        
        highlightTopView = UIView(frame: CGRectMake(0, 0, viewWidth, viewHeight))
        for(var i = 0; i < self.titles?.count; i++ ) {
            let label = createLabelByTitleIndex(i, textColor: titleHighlightColor)
            highlightTopView?.addSubview(label)
        }
        highlightView?.addSubview(highlightTopView!)
        self.addSubview(highlightView!)
    }
    
    func createTopButtons() {
        for (var i = 0; i < self.titles?.count; i++) {
            let frame = CGRectMake(labelWidth * CGFloat(i), 0, labelWidth, viewHeight)
            let button = UIButton(frame: frame)
            button.tag = i
            button.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(button)
        }
    }
    
    func buttonTapped(button: UIButton) {
        
        if let block = buttonClickedBlock {
            if button.tag < titles?.count {
                block(tag: button.tag)
            }
        }
        
        let frame = RectForIndex(button.tag)
        let changedFrame = RectForIndex(-button.tag)
        
        UIView.animateWithDuration(duration, animations: { [weak self]() -> Void in
            self!.highlightView?.frame = frame
            self!.highlightTopView?.frame = changedFrame
            }) { (_) -> Void in
//                sel
        }
    }
    
    
    
    
    //Mark: createLabel both background label & highlightLabel
    func createLabelByTitleIndex(index: Int, textColor: UIColor) -> UILabel {
        let currentLabelFrame = CGRectMake(labelWidth * CGFloat(index), 0, labelWidth, viewHeight)
        let label = UILabel(frame: currentLabelFrame)
        label.textColor = textColor
        label.text = self.titles![index]
        label.font = titlesFont
        label.minimumScaleFactor = 0.1
        label.textAlignment = NSTextAlignment.Center
        
        return label
    }
    
    func RectForIndex(index: Int) ->CGRect {
        return CGRectMake(labelWidth * CGFloat(index), 0, labelWidth, viewHeight)
    }
    
    

}
