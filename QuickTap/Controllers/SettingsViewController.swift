//
//  SettingsViewController.swift
//  QuickTap
//
//  Created by Olivier Miserez on 03/03/2019.
//  Copyright © 2019 Olivier Miserez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UICollectionViewDelegate {
    
    let selectColorModeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Select color mode"
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"AmericanTypewriter",size:18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let selectColorModeCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        return collection
    }()
    
    let highScoreNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "High Score"
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"AmericanTypewriter",size:18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let highScoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Olivier - 18"
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let resetHighScoreButton : UIButton = {
        let b = UIButton()
        b.setTitle("Reset Highscore", for: .normal)
        b.setTitleColor(ColorPalette.black, for: .normal)
        b.backgroundColor = ColorPalette.gray
        b.sizeToFit()
        b.layer.cornerRadius = 6
        b.layer.borderWidth = 2
        b.layer.borderColor = ColorPalette.black.cgColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(resetHighScore), for: .touchUpInside)
        return b
    }()
    
    var colorArray = [ColorPalette.gray, ColorPalette.blue, ColorPalette.purple, ColorPalette.pink, ColorPalette.lightPink, ColorPalette.black, ColorPalette.yellow, ColorPalette.orange, ColorPalette.green]
    let colorArrayNames: [String] = ["gray", "blue", "purple", "pink", "lightpink", "black", "yellow", "orange", "green"]
    
    
    @IBAction func resetHighScore() {
        UserDefaults.standard.set("No high score", forKey: "highScoreName")
        UserDefaults.standard.set(0, forKey: "highScore")
        
        let highScoreName = UserDefaults.standard.string(forKey: "highScoreName") ?? "No high score"
        highScoreLabel.text = "\(highScoreName)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove navigation back arrow
        let mask = UIImage()
        navigationController?.navigationBar.backIndicatorImage = mask
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = mask
        
        let backButton = UIBarButtonItem()
        backButton.title = "🔙"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.title = "Settings"

        view.backgroundColor = ColorPalette.white
        
        selectColorModeCollectionView.delegate = self
        selectColorModeCollectionView.dataSource = self
        
        setupView()
        
        selectColorModeCollectionView.register(colorModeCell.self, forCellWithReuseIdentifier: "Cell")
        selectColorModeCollectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        selectColorModeCollectionView.allowsMultipleSelection = false
        
        
        let highScoreName = UserDefaults.standard.string(forKey: "highScoreName") ?? "No high score"
        let highScore = UserDefaults.standard.integer(forKey: "highScore")
        
        if highScore == 0 {
            highScoreLabel.text = "\(highScoreName)"
        } else {
            highScoreLabel.text = "\(highScoreName): \(highScore)"
        }
        

    }

    
    func setupView() {
        
        // add colde mode label
        view.addSubview(selectColorModeLabel)
        selectColorModeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        selectColorModeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        selectColorModeLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        
        // add color mode collectionview
        view.addSubview(selectColorModeCollectionView)
        selectColorModeCollectionView.topAnchor.constraint(equalTo: selectColorModeLabel.bottomAnchor, constant: 0).isActive = true
        selectColorModeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        selectColorModeCollectionView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        selectColorModeCollectionView.heightAnchor.constraint(equalToConstant: 162).isActive = true
        
        
        // add highscore name label
        view.addSubview(highScoreNameLabel)
        highScoreNameLabel.topAnchor.constraint(equalTo: selectColorModeCollectionView.bottomAnchor, constant: 25).isActive = true
        highScoreNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        highScoreNameLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        
        // add highscore label
        view.addSubview(highScoreLabel)
        highScoreLabel.topAnchor.constraint(equalTo: highScoreNameLabel.bottomAnchor, constant: 10).isActive = true
        highScoreLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        highScoreLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        
        view.addSubview(resetHighScoreButton)
        resetHighScoreButton.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 25).isActive = true
        resetHighScoreButton.leftAnchor.constraint(equalTo: highScoreNameLabel.leftAnchor, constant: 0).isActive = true
        resetHighScoreButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        resetHighScoreButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    


}

extension SettingsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = selectColorModeCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! colorModeCell
        cell.backgroundColor = colorArray[indexPath.row]
        cell.layer.cornerRadius = 6
        
        let themeColor = UserDefaults.standard.string(forKey: "themeColor") ?? "none"
        var currentColorIndex: IndexPath = [0,0]
        for (index, color) in colorArrayNames.enumerated() {
            if color == themeColor {
                currentColorIndex = [0,index]
            }
        }
        selectColorModeCollectionView.selectItem(at: currentColorIndex, animated: true, scrollPosition: .left)
        if indexPath.row == currentColorIndex.row {
            cell.label.text = "✅"
            cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
            cell.layer.shadowRadius = 5
            cell.layer.shadowOffset = .zero
            cell.layer.shadowOpacity = 1
        } else {
            cell.label.text = ""
            cell.layer.shadowOpacity = 0
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size : Int = 60
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = selectColorModeCollectionView.cellForItem(at: indexPath) as! colorModeCell
        
        cell.label.text = "✅"
        cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.layer.shadowRadius = 5
        cell.layer.shadowOffset = .zero
        cell.layer.shadowOpacity = 1
        
        UserDefaults.standard.set("\(colorArrayNames[indexPath.row])", forKey: "themeColor")
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = selectColorModeCollectionView.cellForItem(at: indexPath) as! colorModeCell
        
        cell.label.text = ""
        cell.layer.shadowOpacity = 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}

class colorModeCell: UICollectionViewCell {
    
    let label : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

