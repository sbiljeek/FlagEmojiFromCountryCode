//
//  ViewController.swift
//  FlagEmojiFromCountryCode
//
//  Created by Salman Biljeek on 11/13/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemBackground
        
        // Change the coutry code to see their flag emojis
        let countryCode1 = "BH"
        let countryCode2 = "GB"
        
        let countryCodeLabel1: UILabel = {
            let label = UILabel()
            label.text = countryCode1
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 30)
            return label
        }()
        
        let countryCodeLabel2: UILabel = {
            let label = UILabel()
            label.text = countryCode2
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 30)
            return label
        }()
        
        let arrowImageView1: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .medium))?.withTintColor(.secondaryLabel).withRenderingMode(.alwaysOriginal)
            imageView.image = image
            return imageView
        }()
        
        let arrowImageView2: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .medium))?.withTintColor(.secondaryLabel).withRenderingMode(.alwaysOriginal)
            imageView.image = image
            return imageView
        }()
        
        let flagEmoji1 = self.getCountryFlagEmoji(countryCode: countryCode1)
        let flagEmoji2 = self.getCountryFlagEmoji(countryCode: countryCode2)
        
        let flagLabel1: UILabel = {
            let label = UILabel()
            label.text = flagEmoji1
            label.font = .systemFont(ofSize: 30)
            return label
        }()
        
        let flagLabel2: UILabel = {
            let label = UILabel()
            label.text = flagEmoji2
            label.font = .systemFont(ofSize: 30)
            return label
        }()
        
        let hStack1 = UIStackView(arrangedSubviews: [
            countryCodeLabel1,
            arrowImageView1,
            flagLabel1
        ])
        hStack1.axis = .horizontal
        hStack1.spacing = 10
        hStack1.alignment = .center
        
        let hStack2 = UIStackView(arrangedSubviews: [
            countryCodeLabel2,
            arrowImageView2,
            flagLabel2
        ])
        hStack2.axis = .horizontal
        hStack2.spacing = 10
        hStack2.alignment = .center
        
        let mainStack = UIStackView(arrangedSubviews: [
            hStack1,
            hStack2
        ])
        mainStack.axis = .vertical
        mainStack.alignment = .center
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStack)
        mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func getCountryFlagEmoji(countryCode: String) -> String {
        let base: UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}

