//
//  AnimationLoginViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 31/05/23.
//

import UIKit

class AnimationLoginViewController: UIViewController {

    let indicator: UIActivityIndicatorView = {
       let view = UIActivityIndicatorView()
        view.color = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Work"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .black
//        label.alpha = 0
        return label
    }()
    fileprivate let ountLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ount"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .black
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.setHidesBackButton(true, animated: false)
        startAnimation()
        configureLogoAnimation()
    }
    
    fileprivate func startAnimation() {
        self.view.addSubview(indicator)
        self.view.addSubview(label)
        self.view.addSubview(ountLabel)
        
        // new animation
        
        NSLayoutConstraint.activate([
            indicator.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            indicator.widthAnchor.constraint(equalToConstant: 60),
            indicator.heightAnchor.constraint(equalToConstant: 60),
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 270),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            label.heightAnchor.constraint(equalToConstant: 60),
            
            ountLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 290),
            ountLabel.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 3),
            ountLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
        

        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.indicator.stopAnimating()
            let homeVC = HomeViewController()
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
        UIView.animate(withDuration: 0.9, delay: 0.2, options: [.curveEaseOut]) {
            // do the animation
            self.label.frame = CGRect(x: self.label.frame.origin.x, y: 285, width: self.label.frame.size.width, height: self.label.frame.size.height)
        }
        
        UIView.animate(withDuration: 0.9, delay: 0.7, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: [.curveEaseOut]) {
            self.ountLabel.frame = CGRect(x: -285, y: self.ountLabel.frame.origin.y, width: self.ountLabel.frame.size.width, height: self.ountLabel.frame.size.height)
        }
    }
    
    fileprivate func configureLogoAnimation() {
        
        UIView.animate(withDuration: 2, delay: 0.1, options: UIView.AnimationOptions.curveLinear, animations: {
            self.label.alpha = 1
        }, completion: {
            (completed: Bool) -> Void in
            self.configureLogoAnimation()
        })

    }

}
