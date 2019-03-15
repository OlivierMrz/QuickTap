//
//  GameViewController.swift
//  QuickTap
//
//  Created by Olivier Miserez on 03/03/2019.
//  Copyright © 2019 Olivier Miserez. All rights reserved.
//

import UIKit
import SAConfettiView

class GameViewController: UIViewController {
    
    let player1View : UIView = {
        let v = UIView()
        v.backgroundColor = .green
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let p1WinnerView : SAConfettiView = {
        let v = SAConfettiView()
        v.type = .Confetti
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let p1ScoreNameLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "Your score:"
        l.font = UIFont(name:"AmericanTypewriter",size:16)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p1ScoreLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "0"
        l.font = UIFont(name:"AmericanTypewriter",size:20)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p1NumberOfRounds : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "1/1"
        l.font = UIFont(name:"AmericanTypewriter",size:20)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p1TapLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "TAP"
        l.font = UIFont(name:"Run! Demo",size:28)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p1NameLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "Player 1"
        l.font = UIFont(name:"AmericanTypewriter",size:16)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p1SecondsLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = ""
        l.font = UIFont(name:"AmericanTypewriter",size:18)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p1ReadyButton : UIButton = {
        let b = UIButton()
        b.setTitle("✋🏼 Ready? 🤚🏼", for: .normal)
        b.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .clear
        b.layer.borderWidth = 1
        b.layer.borderColor = ColorPalette.black.cgColor
        b.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        b.layer.cornerRadius = 6
        b.sizeToFit()
        b.alpha = 0
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(p1IsReady), for: .touchUpInside)
        return b
    }()
    
    let player2View : UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let p2WinnerView : SAConfettiView = {
        let v = SAConfettiView()
        v.type = .Confetti
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let p2ScoreNameLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "Your score:"
        l.font = UIFont(name:"AmericanTypewriter",size:16)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p2ScoreLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "0"
        l.font = UIFont(name:"AmericanTypewriter",size:20)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p2NumberOfRounds : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "1/1"
        l.font = UIFont(name:"AmericanTypewriter",size:20)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p2TapLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "TAP"
        l.font = UIFont(name:"Run! Demo",size:28)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p2NameLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "Player 2"
        l.font = UIFont(name:"AmericanTypewriter",size:16)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p2SecondsLabel : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = ""
        l.font = UIFont(name:"AmericanTypewriter",size:18)
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let p2ReadyButton : UIButton = {
        let b = UIButton()
        b.setTitle("✋🏼 Ready? 🤚🏼", for: .normal)
        b.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .clear
        b.layer.borderWidth = 1
        b.layer.borderColor = ColorPalette.black.cgColor
        b.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        b.layer.cornerRadius = 6
        b.sizeToFit()
        b.alpha = 0
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(p2IsReady), for: .touchUpInside)
        return b
    }()
    
    let colorLine : UIView = {
        let l = UIView()
        l.backgroundColor = ColorPalette.redStopLine
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let testView : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    let endGameView : UIView = {
        let v = UIView()
        v.backgroundColor = ColorPalette.gray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var endGameViewLeftContraint = self.endGameView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -(view.bounds.width))
    
    

    
    let backButton : UIButton = {
        let b = UIButton()
        b.setTitle("X", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        b.backgroundColor = .white
        b.sizeToFit()
        b.alpha = 0
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(backBtn_tapped), for: .touchUpInside)
        return b
    }()

    var themecolors : [String:UIColor] = ["gray": ColorPalette.gray,
                                          "blue": ColorPalette.blue,
                                          "purple": ColorPalette.purple,
                                          "pink": ColorPalette.pink,
                                          "lightPink": ColorPalette.lightPink,
                                          "black": ColorPalette.black,
                                          "yellow": ColorPalette.yellow,
                                          "orange": ColorPalette.orange,
                                          "green": ColorPalette.green]
    
    var selectedRounds : Int = 1
    var round : Int = 1
    var playerWins : Int = 0
    
    var p1Points: Int = 0
    var p2Points: Int = 0
    
    var p1isReady:Bool = false
    var p2isReady:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        setupViews()
        
        let themeColor = UserDefaults.standard.string(forKey: "themeColor") ?? "none"
        print(themeColor)
        player1View.backgroundColor = themecolors[themeColor]
        player2View.backgroundColor = themecolors[themeColor]
        
    }
    
    // MARK: CountDown Timer - Begin Game
    var countDownTimer = Timer()
    var seconds : Int = 0
    
    // MARK: second timer
    var timer = Timer()
    var startTime: Double = 0
    var time: Double = 0
    var millisecondsString: String = ""
    
    let randomNumber = Int.random(in: 1...5)
    
    
    // Area detection
    var mySensitiveArea: CGRect?
    var tapOnGameScreen : UITapGestureRecognizer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        seconds = randomNumber
        
        runTimer()
        
        mySensitiveArea = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height/2)
        tapOnGameScreen = UITapGestureRecognizer(target: self, action: #selector(tapForWin(_:)))
        testView.addGestureRecognizer(tapOnGameScreen!)
        
        updateRoundsLabel()
        
        if selectedRounds == 8888 {
            backButton.alpha = 1
        } else {
            backButton.alpha = 0
        }
        
    }
    
    @IBAction func tapForWin(_ gestureRecognizer: UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: self.view)
        
        if mySensitiveArea!.contains(p) {
            timer.invalidate()
            print("Player 1 taps first")
            tapOnGameScreen?.isEnabled = false
            
            if seconds > 0 {
                playerWins = 2
                p1SecondsLabel.text = "You tapped to early! ☠️"
            } else {
                playerWins = 1
//                p2SecondsLabel.text = "You tapped to early! ☠️"
            }
            
        }
        else {
            timer.invalidate()
            print("Player 2 taps first")
            tapOnGameScreen?.isEnabled = false
            if seconds > 0 {
                playerWins = 1
            } else {
                playerWins = 2
            }
        }
        
        if playerWins == 1 {
            player1View.backgroundColor = ColorPalette.winnerGreen
            p1TapLabel.text = "WINNER"
            p1SecondsLabel.text = "\(millisecondsString) Sec. 🚀"
            p1Points = p1Points + 1
            p1ScoreLabel.text = "\(p1Points)"
            player2View.backgroundColor = ColorPalette.loserRed
            p2TapLabel.text = "YOU LOSE"
            p2SecondsLabel.text = "Better next time! ☠️"
            p2ScoreLabel.text = "\(p2Points)"
        } else if playerWins == 2 {
            player1View.backgroundColor = ColorPalette.loserRed
            p1TapLabel.text = "YOU LOSE"
            p1SecondsLabel.text = "Better next time! ☠️"
            p1ScoreLabel.text = "\(p1Points)"
            player2View.backgroundColor = ColorPalette.winnerGreen
            p2TapLabel.text = "WINNER"
            p2SecondsLabel.text = "\(millisecondsString) Sec. 🚀"
            p2Points = p2Points + 1
            p2ScoreLabel.text = "\(p2Points)"
        }
        
        countDownTimer.invalidate()
        timer.invalidate()
        
        if round == selectedRounds {
            
            if p1Points > p2Points {
                print("player 1 wins!")
                p1WinnerView.startConfetti()

            } else if p1Points < p2Points {
                print("player 2 wins!")
                p2WinnerView.startConfetti()
                
            }
            
            performAfter(delay: 1.5) {
                self.timer.invalidate()
                self.p1WinnerView.stopConfetti()
                self.p2WinnerView.stopConfetti()
                
                if self.p1Points > self.p2Points {
                    self.checkHighScore(playerScore: self.p1Points, playerNameLabel: self.p1NameLabel, playerScoreLabel: self.p1ScoreLabel)
                } else {
                    self.checkHighScore(playerScore: self.p2Points, playerNameLabel: self.p2NameLabel, playerScoreLabel: self.p2ScoreLabel)
                }
            }
            
            performAfter(delay: 2) {
                self.dismiss(animated: true, completion: nil)
            }

        } else {
            
            
            UIView.animate(withDuration: 0.75) {
                self.p1ReadyButton.alpha = 1
                self.p2ReadyButton.alpha = 1
            }
            
        }
        
    }
    
    func performAfter(delay: TimeInterval, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            completion()
        }
    }
    
    
    func runTimer() {
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        print(seconds)
        
        if seconds == 0 {
            print("start GAME")
            countDownTimer.invalidate()
            colorLine.backgroundColor = ColorPalette.greenGoLine
            
            startTime = Date().timeIntervalSinceReferenceDate
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                          target: self,
                                          selector: #selector(advanceTimer),
                                          userInfo: nil,
                                          repeats: true)
        }
    }
    
    @objc func advanceTimer(timer: Timer) {
        
        //Total time since timer started, in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        //Convert the time to a string with 4 decimal places
        let timeString = String(format: "%.4f", time)
        
        //Display the time string to a label in our view controller
        millisecondsString = timeString
        print(timeString)
    }
    
    
    @IBAction func p1IsReady() {
        print("p1 is ready")
        if p1isReady {
            p1ReadyButton.backgroundColor = .clear
            p1ReadyButton.setTitle("✋🏼 Ready? 🤚🏼", for: .normal)
            p1isReady = false
        } else {
            p1ReadyButton.backgroundColor = ColorPalette.white
            p1ReadyButton.setTitle("✅ Ready! ✅", for: .normal)
            p1isReady = true
        }
        
        readyForNextRound()
        
    }
    @IBAction func p2IsReady() {
        print("p2 is ready")
        
        if p2isReady {
            p2ReadyButton.backgroundColor = .clear
            p2ReadyButton.setTitle("✋🏼 Ready? 🤚🏼", for: .normal)
            p2isReady = false
        } else {
            p2ReadyButton.backgroundColor = ColorPalette.white
            p2ReadyButton.setTitle("✅ Ready! ✅", for: .normal)
            p2isReady = true
        }
        
        readyForNextRound()
    }
    
    func readyForNextRound() {
        if p1isReady && p2isReady {
            print("play next round")
            
            round += 1
            updateRoundsLabel()
            
            UIView.animate(withDuration: 0.75, delay: 0.5, options: .curveEaseOut, animations: {
                self.p1ReadyButton.alpha = 0
                self.p2ReadyButton.alpha = 0
            }) { (Bool) in
                
                print("ready for next round")
                let themeColor = UserDefaults.standard.string(forKey: "themeColor") ?? "none"
                self.player1View.backgroundColor = self.themecolors[themeColor]
                self.player2View.backgroundColor = self.themecolors[themeColor]
                
                self.colorLine.backgroundColor = ColorPalette.redStopLine
                self.seconds = self.randomNumber
                self.runTimer()
                self.tapOnGameScreen?.isEnabled = true
                self.p1isReady = false
                self.p1ReadyButton.backgroundColor = .clear
                self.p1ReadyButton.setTitle("✋🏼 Ready? 🤚🏼", for: .normal)
                self.p2isReady = false
                self.p2ReadyButton.backgroundColor = .clear
                self.p2ReadyButton.setTitle("✋🏼 Ready? 🤚🏼", for: .normal)
                self.p1TapLabel.text = "TAP"
                self.p2TapLabel.text = "TAP"
                self.p1SecondsLabel.text = ""
                self.p2SecondsLabel.text = ""
                
            }
        }
    }
    
    func updateRoundsLabel() {
        if selectedRounds != 8888 {
            p1NumberOfRounds.text = "\(round)/\(selectedRounds)"
            p2NumberOfRounds.text = "\(round)/\(selectedRounds)"
        } else {
            p1NumberOfRounds.text = "♾"
            p2NumberOfRounds.text = "♾"
        }
    }
    
    
    // MARK: SetupViews()
    func setupViews() {
        
        // MARK: player 1 views & properties
        self.view.addSubview(player1View)
        player1View.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        player1View.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        player1View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        player1View.heightAnchor.constraint(equalToConstant: view.bounds.height/2).isActive = true
        player1View.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        
        player1View.addSubview(p1WinnerView)
        p1WinnerView.heightAnchor.constraint(equalToConstant: view.bounds.height/2).isActive = true
        p1WinnerView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        player1View.addSubview(p1ScoreNameLabel)
        p1ScoreNameLabel.topAnchor.constraint(equalTo: player1View.topAnchor, constant: 16).isActive = true
        p1ScoreNameLabel.leftAnchor.constraint(equalTo: player1View.leftAnchor, constant: 16).isActive = true
        
        player1View.addSubview(p1ScoreLabel)
        p1ScoreLabel.topAnchor.constraint(equalTo: player1View.topAnchor, constant: 16).isActive = true
        p1ScoreLabel.centerXAnchor.constraint(equalTo: player1View.centerXAnchor).isActive = true
        
        player1View.addSubview(p1TapLabel)
        p1TapLabel.centerXAnchor.constraint(equalTo: player1View.centerXAnchor).isActive = true
        p1TapLabel.centerYAnchor.constraint(equalTo: player1View.centerYAnchor, constant: -30).isActive = true
        
        player1View.addSubview(p1NameLabel)
        p1NameLabel.centerXAnchor.constraint(equalTo: player1View.centerXAnchor).isActive = true
        p1NameLabel.bottomAnchor.constraint(equalTo: player1View.safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
        
        player1View.addSubview(p1SecondsLabel)
        p1SecondsLabel.centerXAnchor.constraint(equalTo: player1View.centerXAnchor).isActive = true
        p1SecondsLabel.topAnchor.constraint(equalTo: p1TapLabel.bottomAnchor, constant: 25).isActive = true
        
        player1View.addSubview(p1NumberOfRounds)
        p1NumberOfRounds.topAnchor.constraint(equalTo: p1ScoreLabel.topAnchor, constant: 0).isActive = true
        p1NumberOfRounds.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        // MARK: player 2 views & properties
        self.view.addSubview(player2View)
        player2View.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        player2View.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        player2View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        player2View.heightAnchor.constraint(equalToConstant: view.bounds.height/2).isActive = true
        
        player2View.addSubview(p2WinnerView)
        p2WinnerView.heightAnchor.constraint(equalToConstant: view.bounds.height/2).isActive = true
        p2WinnerView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        player2View.addSubview(p2ScoreNameLabel)
        p2ScoreNameLabel.topAnchor.constraint(equalTo: player2View.topAnchor, constant: 16).isActive = true
        p2ScoreNameLabel.leftAnchor.constraint(equalTo: player2View.leftAnchor, constant: 16).isActive = true
        
        player2View.addSubview(p2ScoreLabel)
        p2ScoreLabel.topAnchor.constraint(equalTo: player2View.topAnchor, constant: 16).isActive = true
        p2ScoreLabel.centerXAnchor.constraint(equalTo: player2View.centerXAnchor).isActive = true
        
        player2View.addSubview(p2TapLabel)
        p2TapLabel.centerXAnchor.constraint(equalTo: player2View.centerXAnchor).isActive = true
        p2TapLabel.centerYAnchor.constraint(equalTo: player2View.centerYAnchor, constant: -30).isActive = true
        
        player2View.addSubview(p2NameLabel)
        p2NameLabel.centerXAnchor.constraint(equalTo: player2View.centerXAnchor).isActive = true
        p2NameLabel.bottomAnchor.constraint(equalTo: player2View.safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
        
        player2View.addSubview(p2SecondsLabel)
        p2SecondsLabel.centerXAnchor.constraint(equalTo: player2View.centerXAnchor).isActive = true
        p2SecondsLabel.topAnchor.constraint(equalTo: p2TapLabel.bottomAnchor, constant: 25).isActive = true
        
        player2View.addSubview(p2NumberOfRounds)
        p2NumberOfRounds.topAnchor.constraint(equalTo: p2ScoreLabel.topAnchor, constant: 0).isActive = true
        p2NumberOfRounds.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        
        // MARK: GO Line
        view.addSubview(colorLine)
        colorLine.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        colorLine.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        colorLine.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        
        
        // tap view
        view.addSubview(testView)
        testView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        testView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        // ready button
        testView.addSubview(p1ReadyButton)
        p1ReadyButton.topAnchor.constraint(equalTo: p1ScoreLabel.bottomAnchor, constant: 30).isActive = true
        p1ReadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        p1ReadyButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        
        testView.addSubview(p2ReadyButton)
        p2ReadyButton.topAnchor.constraint(equalTo: p2SecondsLabel.bottomAnchor, constant: 30).isActive = true
        p2ReadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        // MARK: EndGameView()
        view.addSubview(endGameView)
        endGameView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        endGameView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        endGameViewLeftContraint.isActive = true
        
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: player1View.topAnchor, constant: 40).isActive = true
        backButton.leftAnchor.constraint(equalTo: player1View.leftAnchor, constant: 16).isActive = true
    }
    
    
    func checkHighScore(playerScore : Int, playerNameLabel: UILabel, playerScoreLabel: UILabel) {
        
        if selectedRounds == 8888 {
            
            let highScore = UserDefaults.standard.integer(forKey: "highScore")
            if playerScore > highScore {
                UserDefaults.standard.set("\(playerNameLabel.text!)", forKey: "highScoreName")
                UserDefaults.standard.set("\(playerScoreLabel.text!)", forKey: "highScore")
            }
        }
        
    }
    
    
    @IBAction func backBtn_tapped() {
        timer.invalidate()
        p1WinnerView.stopConfetti()
        p2WinnerView.stopConfetti()
        
        if p1Points > p2Points {
            checkHighScore(playerScore: p1Points, playerNameLabel: p1NameLabel, playerScoreLabel: p1ScoreLabel)
        } else {
            checkHighScore(playerScore: p2Points, playerNameLabel: p2NameLabel, playerScoreLabel: p2ScoreLabel)
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
