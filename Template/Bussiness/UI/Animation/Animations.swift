//
//  Animations.swift
//  Template
//
//  Created by Erick on 26/03/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class Animations: NSObject {

    //MARK: - Animation
    
    //Ejemplo uno
    func translation(view: UIView,finalPosition: CGPoint)
    {
        let theAnimation = CABasicAnimation(keyPath: "position");
        theAnimation.fromValue = CGPoint(x: view.frame.origin.x + view.frame.size.width/2,y: view.frame.origin.y + view.frame.size.height/2)//CGPoint(x: UIScreen.main.bounds.size.width/2, y: view.frame.origin.y)
        theAnimation.toValue = finalPosition
        theAnimation.duration = 5.0;
        theAnimation.autoreverses = true //true - reverses into the initial value either smoothly or not
        theAnimation.repeatCount = 1
        view.layer.add(theAnimation, forKey: "animatePosition")
    }
    
    //Ejemplo dos
    func translationPath(view: UIView, pathArray: Array<CGPoint>)
    {
        let animation = CAKeyframeAnimation()
        var array = Array<CGPoint>()
        
        for i in 0 ..< pathArray.count + 2
        {
            if(i == 0 || i == pathArray.count + 1)
            {
                array.append(CGPoint(x: view.frame.origin.x + view.frame.size.width/2,y: view.frame.origin.y + view.frame.size.height/2))
            }else{
                array.append(pathArray[i-1])
            }
        }
        
        animation.keyPath = "position"
        animation.values = array
        animation.duration = 10.0
        view.layer.add(animation, forKey: "position")
    }
    
    //Ejemplo tres
    func exampleThree(view: UIView)
    {
        var animations = [CABasicAnimation]()
        let posAnimation = CABasicAnimation(keyPath: "position")
        posAnimation.duration = 5.0
        posAnimation.autoreverses = true
        posAnimation.fromValue = CGPoint(x: view.frame.origin.x + view.frame.size.width/2, y: view.frame.origin.y + view.frame.size.height/2)
        posAnimation.toValue = CGPoint(x: 100.0, y: 100.0)
        animations.append(posAnimation)
        
        let heightAnimation = CABasicAnimation(keyPath: "bounds.size")
        heightAnimation.autoreverses = true
        heightAnimation.duration = 3.0
        heightAnimation.fromValue =  CGSize(width: view.frame.size.width, height: view.frame.size.height)
        heightAnimation.toValue = CGSize(width: view.frame.size.width, height: 200.0)
        heightAnimation.beginTime = 4.0
        animations.append(heightAnimation)
        
        let group = CAAnimationGroup()
        group.duration = 10.0
        group.animations = animations
        view.layer.add(group, forKey: nil)
    }
    
    //Ejemplo Cuatro
    func exampleFour(view: UIView)
    {
        UIView.animate(withDuration: 6.0, animations: {
            view.alpha = 0.0
        })
        
        let when = DispatchTime.now() + 6.0 // change 3 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            UIView.animate(withDuration: 5.0, animations: {
                view.alpha = 1.0
            })
        }
    }
    
    //Ejemplo cinco
    func exampleFive(view: UIView)
    {
        var frame = view.frame
        frame.origin.y = 100
        frame.size.height = 150
        
        UIView.animate(withDuration: 10.0, delay: 0.0, options: .curveEaseOut, animations: {
            view.frame = frame
        }) { (true) in
            print("Done")
        }
    }
    
    //Ejemplo Seis
    func exampleSix(view: UIView, label: UILabel)
    {
        UIView.transition(with: view, duration: 1.5, options: .transitionFlipFromBottom, animations: {
            //view.addSubview(self.imageView)
            if(!(label.text?.elementsEqual("XD"))!)
            {
                label.text = "XD"
            }else{
                label.text = ":D"
            }
            
        }, completion: nil)
    }
    
}
