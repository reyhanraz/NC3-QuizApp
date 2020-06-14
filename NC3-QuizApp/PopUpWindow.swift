//
//  PopUpWindow.swift
//  PopUpWindow
//
//

import UIKit

protocol PopUpDelegate {
    func handleDismissalYes()
    func handleDismissalNo()
}

class PopUpWindow: UIView {

    // MARK: - Properties
    
    var delegate: PopUpDelegate?
    
    
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Correct!"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let titlefactLbl: UILabel = {
        let label = UILabel()
        label.text = "Song Fact:"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    var factBodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "My Heart Will Go On in Titanic\nmovie is a demo track and\nrecorded in just one take.  "
        label.textAlignment = .center
        label.font = UIFont(name: "SF Pro Text", size: 17)
        return label
    }()
    
    let continueLbl: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 102/255, green: 101/255, blue: 101/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "Let's continue to get more points! "
        label.textAlignment = .center
        label.font = UIFont(name: "SF Pro Text", size: 14)
        return label
    }()
    
    var imageCont: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let Yesbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "yesPopup.png"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissalYes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let Nobutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "noPopup.png"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissalNo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageCont)
        imageCont.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageCont.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -28).isActive = true
        imageCont.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageCont.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageCont.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(titlefactLbl)
        titlefactLbl.bottomAnchor.constraint(equalTo: imageCont.topAnchor, constant: -10).isActive = true
        titlefactLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(titleLbl)
        titleLbl.bottomAnchor.constraint(equalTo: titlefactLbl.topAnchor, constant: -20).isActive = true
        titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(factBodyLabel)
        factBodyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        factBodyLabel.topAnchor.constraint(equalTo: imageCont.bottomAnchor, constant: 20).isActive = true
            
        addSubview(Yesbutton)
        Yesbutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Yesbutton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        Yesbutton.leftAnchor.constraint(equalTo: centerXAnchor, constant: 12).isActive = true
        Yesbutton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        Yesbutton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
        addSubview(Nobutton)
        Nobutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Nobutton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        Nobutton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        Nobutton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        Nobutton.rightAnchor.constraint(equalTo: centerXAnchor, constant: -12).isActive = true
        
        addSubview(continueLbl)
        continueLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueLbl.bottomAnchor.constraint(equalTo: Yesbutton.topAnchor, constant: -10).isActive = true
    }
    
    func initFrame(image: String, fact: String){
        imageCont.image = UIImage(named: image)
        factBodyLabel.text = fact
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissalYes() {
        delegate?.handleDismissalYes()
    }
    @objc func handleDismissalNo() {
        delegate?.handleDismissalNo()
    }
    
}

//MARK: Class for popup wrong answer

class PopUpWindowForWrong: UIView {

    // MARK: - Properties
    
    var delegate: PopUpDelegate?
    
    
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Wrong!"
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "Oops too bad...\nYour answer is wrong."
        label.textAlignment = .center
        label.font = UIFont(name: "SF Pro Text", size: 17)
        return label
    }()
    
    let continueLbl: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 102/255, green: 101/255, blue: 101/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "Do you want to continue\nfor 100 points? "
        label.textAlignment = .center
        label.font = UIFont(name: "SF Pro Text", size: 14)
        return label
    }()
    
    let Yesbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "yesPopup.png"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissalYes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let Nobutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "noPopup.png"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissalNo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFrame()
    }
    
    func initFrame(){
        
        addSubview(bodyLabel)
        
        bodyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bodyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        
        addSubview(titleLbl)
        titleLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor, constant: -20).isActive = true
        titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
  
        addSubview(Yesbutton)
        Yesbutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Yesbutton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        Yesbutton.leftAnchor.constraint(equalTo: centerXAnchor, constant: 12).isActive = true
        Yesbutton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        Yesbutton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
        addSubview(Nobutton)
        Nobutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Nobutton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        Nobutton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        Nobutton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        Nobutton.rightAnchor.constraint(equalTo: centerXAnchor, constant: -12).isActive = true
        
        addSubview(continueLbl)
        continueLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueLbl.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20).isActive = true
        continueLbl.bottomAnchor.constraint(equalTo: Yesbutton.topAnchor, constant: -10).isActive = true
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissalYes() {
        delegate?.handleDismissalYes()
    }
    @objc func handleDismissalNo() {
        delegate?.handleDismissalNo()
    }
    
}
