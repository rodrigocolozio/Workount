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
        label.text = "Workount"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .black
        label.alpha = 0
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
        
        indicator.widthAnchor.constraint(equalToConstant: 60).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 60).isActive = true
        indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        label.bottomAnchor.constraint(equalTo: indicator.topAnchor, constant: -40).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.indicator.stopAnimating()
            let homeVC = HomeViewController()
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
    }
    
    fileprivate func configureLogoAnimation() {
        
        UIView.animate(withDuration: 2, delay: 0.1, options: UIView.AnimationOptions.curveLinear, animations: {
            self.label.alpha = 1
        }, completion: {
            (completed: Bool) -> Void in
            self.configureLogoAnimation()
        })
        
//        UIView.animate(withDuration: 1.5, animations: {
//            self.label.alpha = 1
//        }, completion: {
//            (completed: Bool) -> Void in
//            UIView.animate(withDuration: 1.5, delay: 1, options: UIView.AnimationOptions.curveLinear, animations: {
//                self.label.alpha = 0.2
//            }, completion: {
//                (completed: Bool) -> Void in
//                self.configureLogoAnimation()
//
//            })
//        })
        /* do some animation with a label showing Workount
         
         think about a fade transition
         */
    }

}
