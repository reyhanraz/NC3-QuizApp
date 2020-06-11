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
    
    var showSuccessMessage: Bool? {
        didSet {
            guard let success = showSuccessMessage else { return }
            if success {
                checkLabel.text = "✓"
                //notificationLabel.text = "Success"
                checkLabel.textColor = UIColor(red: 147/255, green: 227/255, blue: 105/255, alpha: 1)
            } else {
                checkLabel.text = "X"
                //notificationLabel.text = "Error"
                checkLabel.textColor = .red
            }
        }
    }
    
    let checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 96)
        
        return label
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "My Heart Will Go On in Titanic\nmovie is a demo track and\nrecorded in just one take.  "
        label.textAlignment = .center
        label.font = UIFont(name: "SF Pro Text", size: 17)
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
//        button.backgroundColor = .blue
//        button.setTitle("OK", for: .normal)
        button.setImage(UIImage(named: "yesPopup.png"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissalYes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let Nobutton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .red
//        button.setTitle("NO", for: .normal)
        button.setImage(UIImage(named: "noPopup.png"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissalNo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(displayP3Red: 186/255, green: 215/255, blue: 232/255, alpha: 1)
        addSubview(imageCont)
        imageCont.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageCont.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -28).isActive = true
        imageCont.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageCont.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageCont.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(checkLabel)
        //checkLabel.bottomAnchor.constraint(equalTo: imageCont.topAnchor, constant: -28).isActive = true
        checkLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
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
        
        addSubview(notificationLabel)
        notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        notificationLabel.topAnchor.constraint(equalTo: imageCont.bottomAnchor, constant: 20).isActive = true
        
        
        imageCont.image = UIImage(named: "gambarQ1.png")
        print(self.frame.size)

        
        
//        addSubview(imageCont)
//        imageCont.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        imageCont.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
//        imageCont.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
//        imageCont.rightAnchor.constraint(equalTo: centerXAnchor, constant: -12).isActive = true
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
