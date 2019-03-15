//
//  ViewController.swift
//  QuickTap
//
//  Created by Olivier Miserez on 01/03/2019.
//  Copyright © 2019 Olivier Miserez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ColorPalette.gray
        return v
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Quick Tap"
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"Run! Demo",size:40)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let selectRoundsSubLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Select rounds:"
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"AmericanTypewriter",size:18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let selectRoundsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        return collection
    }()
    
    let setPlayerNamesLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Player names:"
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"AmericanTypewriter",size:18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let playerOneNameTextField: UITextField = {
        let lbl = UITextField()
        lbl.placeholder = "Player 1"
        lbl.text = "Player 1"
        lbl.clearButtonMode = .whileEditing
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"AmericanTypewriter",size:18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = ColorPalette.white
        lbl.layer.cornerRadius = 6
        lbl.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 35))
        lbl.leftViewMode = .always
        
        return lbl
    }()
    let playerTwoNameTextField: UITextField = {
        let lbl = UITextField()
        lbl.placeholder = "Player 2"
        lbl.text = "Player 2"
        lbl.clearButtonMode = .whileEditing
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"AmericanTypewriter",size:18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = ColorPalette.white
        lbl.layer.cornerRadius = 6
        lbl.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 35))
        lbl.leftViewMode = .always
        return lbl
    }()
    
    let playButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("PLAY GAME", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let rounds : [Int] = [1, 3, 5, 8888]
    var selectedRound : Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorPalette.gray
        
        let btn1 = UIButton(type: .custom)
        btn1.setTitle("⚙️", for: .normal)
        btn1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn1.addTarget(self, action: #selector(goToSettingsBtn), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        
        selectRoundsCollectionView.delegate = self
        selectRoundsCollectionView.dataSource = self
        
        setupView()
        
        selectRoundsCollectionView.register(roundsCell.self, forCellWithReuseIdentifier: "Cell")
        selectRoundsCollectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        selectRoundsCollectionView.allowsMultipleSelection = false
        
        playButton.addTarget(self, action: #selector(playGameBtn), for: .touchUpInside)
        
        
        // setup keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    
    
    
    @IBAction func playGameBtn() {
        let GameVC = GameViewController()
        GameVC.p1NameLabel.text = playerOneNameTextField.text
        GameVC.p2NameLabel.text = playerTwoNameTextField.text
        GameVC.selectedRounds = selectedRound
        present(GameVC, animated: true, completion: nil)
    }
    
    @IBAction func goToSettingsBtn() {
        let newViewController = SettingsViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func setupView() {
        
        // add scrollView
        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        // add title
        scrollView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        // add sub label
        scrollView.addSubview(selectRoundsSubLabel)
        selectRoundsSubLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        selectRoundsSubLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        selectRoundsSubLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        
        // add stack view for buttons
        scrollView.addSubview(selectRoundsCollectionView)
        selectRoundsCollectionView.topAnchor.constraint(equalTo: selectRoundsSubLabel.bottomAnchor, constant: 0).isActive = true
        selectRoundsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        selectRoundsCollectionView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        selectRoundsCollectionView.heightAnchor.constraint(equalToConstant: 50*2+42).isActive = true
        
        // add player names label
        scrollView.addSubview(setPlayerNamesLabel)
        setPlayerNamesLabel.topAnchor.constraint(equalTo: selectRoundsCollectionView.bottomAnchor, constant: 25).isActive = true
        setPlayerNamesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        setPlayerNamesLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        
        // add player ONE textfields
        scrollView.addSubview(playerOneNameTextField)
        playerOneNameTextField.topAnchor.constraint(equalTo: setPlayerNamesLabel.bottomAnchor, constant: 16).isActive = true
        playerOneNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        playerOneNameTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        playerOneNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        // add player ONE textfields
        scrollView.addSubview(playerTwoNameTextField)
        playerTwoNameTextField.topAnchor.constraint(equalTo: playerOneNameTextField.bottomAnchor, constant: 16).isActive = true
        playerTwoNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        playerTwoNameTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        playerTwoNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // add PLAY button
        scrollView.addSubview(playButton)
        playButton.topAnchor.constraint(equalTo: playerTwoNameTextField.bottomAnchor, constant: 25).isActive = true
        playButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 32).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16).isActive = true
        
        
        
        
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = .default
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneWithNumberPad))]
        numberToolbar.sizeToFit()
        playerTwoNameTextField.inputAccessoryView = numberToolbar
        playerOneNameTextField.inputAccessoryView = numberToolbar
            
        
        
        
        
        
    }

    @IBAction func doneWithNumberPad() {
        self.view.endEditing(true)
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = selectRoundsCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! roundsCell
        cell.backgroundColor = ColorPalette.white
        cell.layer.cornerRadius = 6
        cell.layer.borderWidth = 2
        cell.layer.borderColor = ColorPalette.black.cgColor
        
        selectRoundsCollectionView.selectItem(at: [0,0], animated: true, scrollPosition: .left)
        
        if indexPath.row == 0 {
            cell.label.text = "1"
            cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
            cell.layer.shadowRadius = 5
            cell.layer.shadowOffset = .zero
            cell.layer.shadowOpacity = 0.75
        } else if indexPath.row == 1 {
            cell.label.text = "3"
        } else if indexPath.row == 2 {
            cell.label.text = "5"
        } else if indexPath.row == 3 {
            cell.label.text = "Endless mode"
        }
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 3 {
            return CGSize(width: selectRoundsCollectionView.bounds.width - 32, height: (200/4))
        } else {
            return CGSize(width: (selectRoundsCollectionView.bounds.width)/3 - 20, height: (200/4))
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = selectRoundsCollectionView.cellForItem(at: indexPath) as! roundsCell
        
        selectRoundsCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)

        
        
        cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.layer.shadowRadius = 5
        cell.layer.shadowOffset = .zero
        cell.layer.shadowOpacity = 0.75
        
//        print("rounds off: ", rounds[indexPath.row])
        selectedRound = rounds[indexPath.row]
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = selectRoundsCollectionView.cellForItem(at: indexPath) as! roundsCell
        selectRoundsCollectionView.deselectItem(at: indexPath, animated: true)
        cell.layer.shadowOpacity = 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
}


class roundsCell: UICollectionViewCell {
    
    let label : UILabel = {
        let lbl = UILabel()
        lbl.text = "1"
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

