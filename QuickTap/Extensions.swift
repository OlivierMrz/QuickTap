//
//  Extensions.swift
//  QuickTap
//
//  Created by Olivier school on 03/03/2019.
//  Copyright © 2019 Olivier Miserez. All rights reserved.
//

import UIKit

enum ColorPalette {
    
    static let gray =  UIColor(red:0.949, green: 0.949, blue: 0.949, alpha: 1.000)
    
    static let winnerGreen =  UIColor(red:0.345, green: 0.948, blue: 0.531, alpha: 1.000)
    
    static let black =  UIColor(red:0.171, green: 0.171, blue: 0.171, alpha: 1.000)
    
    static let yellow =  UIColor(red:1.000, green: 0.956, blue: 0.632, alpha: 1.000)
    
    static let orange =  UIColor(red:1.000, green: 0.636, blue: 0.425, alpha: 1.000)
    
    static let green =  UIColor(red:0.549, green: 0.865, blue: 0.607, alpha: 1.000)
    
    static let blue =  UIColor(red:0.037, green: 0.437, blue: 0.904, alpha: 1.000)
    
    static let loserRed =  UIColor(red:1.000, green: 0.276, blue: 0.276, alpha: 1.000)
    
    static let white =  UIColor(red:1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    static let purple =  UIColor(red:0.541, green: 0.241, blue: 1.000, alpha: 1.000)
    
    static let pink =  UIColor(red:1.000, green: 0.344, blue: 0.740, alpha: 1.000)
    
    static let lightPink =  UIColor(red:1.000, green: 0.723, blue: 0.820, alpha: 1.000)
    
    static let lightGrey =  UIColor(red:0.788, green: 0.788, blue: 0.788, alpha: 1.000)
    
    static let redStopLine =  UIColor(red:1.000, green: 0.276, blue: 0.276, alpha: 1.000)
    
    static let greenGoLine =  UIColor(red:0.345, green: 0.948, blue: 0.531, alpha: 1.000)
}


open class ToastView: UILabel {
    
    var overlayView = UIView()
    var backView = UIView()
    var lbl = UILabel()
    
    class var shared: ToastView {
        struct Static {
            static let instance: ToastView = ToastView()
        }
        return Static.instance
    }
    
    func setup(_ view: UIView,txt_msg:String)
    {
        let white = UIColor ( red: 1/255, green: 0/255, blue:0/255, alpha: 0.0 )
        
        backView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
        backView.center = view.center
        backView.backgroundColor = white
        view.addSubview(backView)
        
        overlayView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60  , height: 50)
        overlayView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2 - 100)
        overlayView.backgroundColor = UIColor.black
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.alpha = 0
        
        lbl.frame = CGRect(x: 0, y: 0, width: overlayView.frame.width, height: 50)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.white
        lbl.center = overlayView.center
        lbl.text = txt_msg
        lbl.textAlignment = .center
        lbl.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        overlayView.addSubview(lbl)
        
        view.addSubview(overlayView)
    }
    
    open func short(_ view: UIView,txt_msg:String) {
        self.setup(view,txt_msg: txt_msg)
        //Animation
        UIView.animate(withDuration: 1.2, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 1.2, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 1.2, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
    }
    
    open func long(_ view: UIView,txt_msg:String) {
        self.setup(view,txt_msg: txt_msg)
        //Animation
        UIView.animate(withDuration: 2, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 2, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
    }
}
