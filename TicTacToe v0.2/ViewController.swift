//
//  ViewController.swift
//  TicTacToe v0.2
//
//  Created by Andrew Hansen on 30/09/2015.
//  Copyright © 2015 Andrew Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbOutcome: UILabel!
    
    @IBOutlet weak var imgSqr1: UIImageView!
    @IBOutlet weak var imgSqr2: UIImageView!
    @IBOutlet weak var imgSqr3: UIImageView!
    @IBOutlet weak var imgSqr4: UIImageView!
    @IBOutlet weak var imgSqr5: UIImageView!
    @IBOutlet weak var imgSqr6: UIImageView!
    @IBOutlet weak var imgSqr7: UIImageView!
    @IBOutlet weak var imgSqr8: UIImageView!
    @IBOutlet weak var imgSqr9: UIImageView!
    
    let rect1 = CGRectMake(40, 166, 75, 75)
    let rect2 = CGRectMake(123, 166, 75, 75)
    let rect3 = CGRectMake(206, 166, 75, 75)
    let rect4 = CGRectMake(40, 249, 75, 75)
    let rect5 = CGRectMake(123, 249, 75, 75)
    let rect6 = CGRectMake(206, 249, 75, 75)
    let rect7 = CGRectMake(40, 332, 75, 75)
    let rect8 = CGRectMake(123, 332, 75, 75)
    let rect9 = CGRectMake(206, 332, 75, 75)
    
    let wins = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    var emptySquares = [1,2,3,4,5,6,7,8,9]
    var xSquares:[Int] = []
    var oSquares:[Int] = []
    
    func checkPlayerHasWon() -> Bool{
        return false
    }// end checkPlayerHasWon
    
    func checkOpportunities() -> [[Int]]{
        var theOpportunities:[[Int]] = []
        
        for wayToWin in wins{
            if xSquares.contains(wayToWin[0]) && xSquares.contains(wayToWin[1]) && emptySquares.contains(wayToWin[2]){
                theOpportunities.append(wayToWin)
            }
            if xSquares.contains(wayToWin[1]) && xSquares.contains(wayToWin[2]) && emptySquares.contains(wayToWin[0]){
                theOpportunities.append(wayToWin)
            }
            if xSquares.contains(wayToWin[0]) && xSquares.contains(wayToWin[2]) && emptySquares.contains(wayToWin[1]){
                theOpportunities.append(wayToWin)
            }
        }
        
        return theOpportunities
    }// end checkOpportunities
    
    func checkThreats() -> [[Int]]{
        var theThreats:[[Int]] = []
        
        for wayToWin in wins{
            if oSquares.contains(wayToWin[0]) && oSquares.contains(wayToWin[1]) && emptySquares.contains(wayToWin[2]){
                theThreats.append(wayToWin)
            }
            if oSquares.contains(wayToWin[1]) && oSquares.contains(wayToWin[2]) && emptySquares.contains(wayToWin[0]){
                theThreats.append(wayToWin)
            }
            if oSquares.contains(wayToWin[0]) && oSquares.contains(wayToWin[2]) && emptySquares.contains(wayToWin[1]){
                theThreats.append(wayToWin)
            }
        }
        
        return theThreats
    }// end checkThreats
    
    func benefitialSquares() -> [[Int]]{
        var theBenefitials:[[Int]] = []
        
        for wayToWin in wins{
            if xSquares.contains(wayToWin[0]) && emptySquares.contains(wayToWin[1]) && emptySquares.contains(wayToWin[2]){
                theBenefitials.append(wayToWin)
            }
            if xSquares.contains(wayToWin[1]) && emptySquares.contains(wayToWin[0]) && emptySquares.contains(wayToWin[2]){
                theBenefitials.append(wayToWin)
            }
            if xSquares.contains(wayToWin[2]) && emptySquares.contains(wayToWin[0]) && emptySquares.contains(wayToWin[1]){
                theBenefitials.append(wayToWin)
            }
        }
        
        return theBenefitials
        
    }// end benefitialSquares
    
    func computerMove() {
        print("Computer move called.")
        // First we need to grab our second square to be unbeatable
        if xSquares.count == 1{
            if emptySquares.contains(9){
                imgSqr9.image = UIImage(named: "X_image")
                xSquares.append(9)
                emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
            }// endif
            else{
                imgSqr5.image = UIImage(named: "X_image")
                xSquares.append(5)
                emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
            }
        }
        else{ //Now that we have made our first two moves...
            
            if checkPlayerHasWon(){ // Check if player has one.  It's no point going on if they have.
                lbOutcome.text = "Player wins"
            }
            else{
                // Check for opportunities.  We'll take a win if we can get it
                var opportunities = checkOpportunities()
                
                // Check for threats.  We'll block a threat if it exists
                var threats = checkThreats()
                
                // Collect a pair.  If we have one square and the other two are empty grab one of them
                var benefitials = benefitialSquares()
                
                if opportunities.count > 0{ // There is a way to win
                    let sqr1 = opportunities[0][0]
                    let sqr2 = opportunities[0][1]
                    let sqr3 = opportunities[0][2]
                    
                    if emptySquares.contains(sqr1){
                        switch sqr1
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        default:
                            print("Somehow I got a wrong number.")
                        
                        }
                    }
                    else if emptySquares.contains(sqr2){
                        switch sqr2
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        default:
                            print("Somehow I got a wrong number.")
                            
                        }
                        
                    }
                    else{
                        switch sqr3
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            lbOutcome.text = "Computer wins!!"
                        default:
                            print("Somehow I got a wrong number.")
                            
                        }
                        
                    }
                    
                }
                else if threats.count > 0{
                    let sqr1 = threats[0][0]
                    let sqr2 = threats[0][1]
                    let sqr3 = threats[0][2]
                    
                    if emptySquares.contains(sqr1){
                        switch sqr1
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            xSquares.append(1)
                            emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                            
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            xSquares.append(2)
                            emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                            
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            xSquares.append(3)
                            emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                            
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            xSquares.append(4)
                            emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                            
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            xSquares.append(5)
                            emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                            
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            xSquares.append(6)
                            emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                            
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            xSquares.append(7)
                            emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                            
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            xSquares.append(8)
                            emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                            
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            xSquares.append(9)
                            emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                            
                        default:
                            print("Somehow I got a wrong number.")
                            
                            
                        }
                    }
                    else if emptySquares.contains(sqr2){
                        switch sqr2
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            xSquares.append(1)
                            emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                            
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            xSquares.append(2)
                            emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                            
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            xSquares.append(3)
                            emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                            
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            xSquares.append(4)
                            emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                            
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            xSquares.append(5)
                            emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                            
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            xSquares.append(6)
                            emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                            
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            xSquares.append(7)
                            emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                            
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            xSquares.append(8)
                            emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                            
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            xSquares.append(9)
                            emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                            
                        default:
                            print("Somehow I got a wrong number.")
                        }
                        
                    }
                    else{
                        switch sqr3
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            xSquares.append(1)
                            emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                            
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            xSquares.append(2)
                            emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                            
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            xSquares.append(3)
                            emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                            
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            xSquares.append(4)
                            emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                            
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            xSquares.append(5)
                            emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                            
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            xSquares.append(6)
                            emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                            
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            xSquares.append(7)
                            emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                            
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            xSquares.append(8)
                            emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                            
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            xSquares.append(9)
                            emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                            
                        default:
                            print("Somehow I got a wrong number.")
                        }
                    }
                } // end if threats
                else if benefitials.count > 0{
                    let sqr1 = benefitials[0][0]
                    let sqr2 = benefitials[0][1]
                    let sqr3 = benefitials[0][2]
                    
                    if xSquares.contains(sqr1){
                        switch sqr2
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            xSquares.append(1)
                            emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                            
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            xSquares.append(2)
                            emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                            
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            xSquares.append(3)
                            emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                            
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            xSquares.append(4)
                            emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                            
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            xSquares.append(5)
                            emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                            
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            xSquares.append(6)
                            emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                            
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            xSquares.append(7)
                            emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                            
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            xSquares.append(8)
                            emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                            
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            xSquares.append(9)
                            emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                            
                        default:
                            print("Somehow I got a wrong number.")
                        }
                    }
                    else if xSquares.contains(sqr2){
                        switch sqr3
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            xSquares.append(1)
                            emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                            
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            xSquares.append(2)
                            emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                            
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            xSquares.append(3)
                            emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                            
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            xSquares.append(4)
                            emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                            
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            xSquares.append(5)
                            emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                            
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            xSquares.append(6)
                            emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                            
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            xSquares.append(7)
                            emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                            
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            xSquares.append(8)
                            emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                            
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            xSquares.append(9)
                            emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                            
                        default:
                            print("Somehow I got a wrong number.")
                        }
                    }
                    else{
                        switch sqr1
                        {
                        case 1:
                            imgSqr1.image = UIImage(named: "X_image")
                            xSquares.append(1)
                            emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                            
                        case 2:
                            imgSqr2.image = UIImage(named: "X_image")
                            xSquares.append(2)
                            emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                            
                        case 3:
                            imgSqr3.image = UIImage(named: "X_image")
                            xSquares.append(3)
                            emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                            
                        case 4:
                            imgSqr4.image = UIImage(named: "X_image")
                            xSquares.append(4)
                            emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                            
                        case 5:
                            imgSqr5.image = UIImage(named: "X_image")
                            xSquares.append(5)
                            emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                            
                        case 6:
                            imgSqr6.image = UIImage(named: "X_image")
                            xSquares.append(6)
                            emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                            
                        case 7:
                            imgSqr7.image = UIImage(named: "X_image")
                            xSquares.append(7)
                            emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                            
                        case 8:
                            imgSqr8.image = UIImage(named: "X_image")
                            xSquares.append(8)
                            emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                            
                        case 9:
                            imgSqr9.image = UIImage(named: "X_image")
                            xSquares.append(9)
                            emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                            
                        default:
                            print("Somehow I got a wrong number.")
                        }
                    }
                } // End if benefitials
                else {  // Grab any empty square.  It won't make any difference which one
                    let sqr = emptySquares[0]
                    switch sqr
                    {
                    case 1:
                        imgSqr1.image = UIImage(named: "X_image")
                        xSquares.append(1)
                        emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                        
                    case 2:
                        imgSqr2.image = UIImage(named: "X_image")
                        xSquares.append(2)
                        emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                        
                    case 3:
                        imgSqr3.image = UIImage(named: "X_image")
                        xSquares.append(3)
                        emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                        
                    case 4:
                        imgSqr4.image = UIImage(named: "X_image")
                        xSquares.append(4)
                        emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                        
                    case 5:
                        imgSqr5.image = UIImage(named: "X_image")
                        xSquares.append(5)
                        emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                        
                    case 6:
                        imgSqr6.image = UIImage(named: "X_image")
                        xSquares.append(6)
                        emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                        
                    case 7:
                        imgSqr7.image = UIImage(named: "X_image")
                        xSquares.append(7)
                        emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                        
                    case 8:
                        imgSqr8.image = UIImage(named: "X_image")
                        xSquares.append(8)
                        emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                        
                    case 9:
                        imgSqr9.image = UIImage(named: "X_image")
                        xSquares.append(9)
                        emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                        
                    default:
                        print("Somehow I got a wrong number.")
                    }
                }
            }
        }
        if emptySquares.count == 0{
            lbOutcome.text = "Tied game."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgSqr1.image = UIImage(named: "X_image")
        imgSqr2.image = UIImage(named: "Blank_image")
        imgSqr3.image = UIImage(named: "Blank_image")
        imgSqr4.image = UIImage(named: "Blank_image")
        imgSqr5.image = UIImage(named: "Blank_image")
        imgSqr6.image = UIImage(named: "Blank_image")
        imgSqr7.image = UIImage(named: "Blank_image")
        imgSqr8.image = UIImage(named: "Blank_image")
        imgSqr9.image = UIImage(named: "Blank_image")
        
        xSquares.append(1)
        emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTap(sender: UITapGestureRecognizer) {
        
        let myPoint = sender.locationInView(self.view)
        
        if CGRectContainsPoint(rect1, myPoint){
            lbOutcome.text = "Sqr 1"
            if emptySquares.contains(1){
                imgSqr1.image = UIImage(named: "O_image")
                oSquares.append(1)
                emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
                computerMove()
            }
            
        }
        else if CGRectContainsPoint(rect2, myPoint){
            lbOutcome.text = "Sqr 2"
            if emptySquares.contains(2){
                imgSqr2.image = UIImage(named: "O_image")
                oSquares.append(2)
                emptySquares.removeAtIndex(emptySquares.indexOf(2)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect3, myPoint){
            lbOutcome.text = "Sqr 3"
            if emptySquares.contains(3){
                imgSqr3.image = UIImage(named: "O_image")
                oSquares.append(3)
                emptySquares.removeAtIndex(emptySquares.indexOf(3)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect4, myPoint){
            lbOutcome.text = "Sqr 4"
            if emptySquares.contains(4){
                imgSqr4.image = UIImage(named: "O_image")
                oSquares.append(4)
                emptySquares.removeAtIndex(emptySquares.indexOf(4)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect5, myPoint){
            lbOutcome.text = "Sqr 5"
            if emptySquares.contains(5){
                imgSqr5.image = UIImage(named: "O_image")
                oSquares.append(5)
                emptySquares.removeAtIndex(emptySquares.indexOf(5)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect6, myPoint){
            lbOutcome.text = "Sqr 6"
            if emptySquares.contains(6){
                imgSqr6.image = UIImage(named: "O_image")
                oSquares.append(6)
                emptySquares.removeAtIndex(emptySquares.indexOf(6)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect7, myPoint){
            lbOutcome.text = "Sqr 7"
            if emptySquares.contains(7){
                imgSqr7.image = UIImage(named: "O_image")
                oSquares.append(7)
                emptySquares.removeAtIndex(emptySquares.indexOf(7)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect8, myPoint){
            lbOutcome.text = "Sqr 8"
            if emptySquares.contains(8){
                imgSqr8.image = UIImage(named: "O_image")
                oSquares.append(8)
                emptySquares.removeAtIndex(emptySquares.indexOf(8)!)
                computerMove()
            }
        }
        else if CGRectContainsPoint(rect9, myPoint){
            lbOutcome.text = "Sqr 9"
            if emptySquares.contains(9){
                imgSqr9.image = UIImage(named: "O_image")
                oSquares.append(9)
                emptySquares.removeAtIndex(emptySquares.indexOf(9)!)
                computerMove()
            }
        }
        else{
            lbOutcome.text = "Outside"
        }
        
    }


    @IBAction func doResetGame(sender: AnyObject) {
        emptySquares = [1,2,3,4,5,6,7,8,9]
        xSquares = []
        oSquares = []
        imgSqr1.image = UIImage(named: "Blank_image")
        imgSqr2.image = UIImage(named: "Blank_image")
        imgSqr3.image = UIImage(named: "Blank_image")
        imgSqr4.image = UIImage(named: "Blank_image")
        imgSqr5.image = UIImage(named: "Blank_image")
        imgSqr6.image = UIImage(named: "Blank_image")
        imgSqr7.image = UIImage(named: "Blank_image")
        imgSqr8.image = UIImage(named: "Blank_image")
        imgSqr9.image = UIImage(named: "Blank_image")
        
        imgSqr1.image = UIImage(named: "X_image")
        xSquares.append(1)
        emptySquares.removeAtIndex(emptySquares.indexOf(1)!)
        lbOutcome.text = "Game in progress"
        
    }

}

