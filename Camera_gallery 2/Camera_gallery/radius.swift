//
//  radius.swift
//  Camera_gallery
//
//  Created by MAC OS 14 on 29/06/22.
//

import Foundation
import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ininitalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ininitalSetup()
    }
    private func ininitalSetup(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
       // layer.shadowOpacity = 5
      //  layer.shadowRadius = 5.0
        layer.masksToBounds = false
        layer.cornerRadius = 20.0
        layer.borderWidth = 2
        layer.borderColor = UIColor.gray.cgColor
        
    }
}
class CardView1: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ininitalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ininitalSetup()
    }
    private func ininitalSetup(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2.0
        layer.masksToBounds = false
        layer.cornerRadius = 20
        
        
    }
}
