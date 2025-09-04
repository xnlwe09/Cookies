//
//  ViewController.swift
//  Cookie
//
//  Created by 신주희 on 9/4/25.
//

import UIKit

        class MyViewController: UIViewController {
            let numLabel = UILabel()
            let openButton = UIButton()
            let imageView = UIImageView()
            let loadButton = UIButton()
            var numCount: Int = 10
            
            var state: Bool = true

            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = UIColor(hexCode: "FDF5Ed")
                
                numLabel.text = "남은 포춘쿠키 : \(numCount)개"
                numLabel.textColor = .black
                numLabel.translatesAutoresizingMaskIntoConstraints = false
                //Auto Layout 쓴다고 알리는 거임
                numLabel.font = UIFont.systemFont(ofSize: 13)
                
                openButton.setTitle("포춘 쿠키를 열어보세요!", for: .normal)
                openButton.titleLabel?.textColor = .white
                openButton.backgroundColor = UIColor(hexCode: "FFB266")
                openButton.translatesAutoresizingMaskIntoConstraints = false
                openButton.layer.cornerRadius = 5
                openButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
                imageView.image = UIImage(named: "cookie")
                imageView.translatesAutoresizingMaskIntoConstraints = false
                
                loadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
                loadButton.tintColor = UIColor(hexCode: "FFB266")
                loadButton.translatesAutoresizingMaskIntoConstraints = false
                loadButton.addTarget(self, action: #selector(loadTapped), for: .touchUpInside)
                loadButton.contentVerticalAlignment = .fill
                loadButton.contentHorizontalAlignment = .fill
                
                view.addSubview(numLabel) //view에 label 추가
                view.addSubview(openButton)
                view.addSubview(imageView)
                view.addSubview(loadButton)
                
                    //Auto Layout
                
                   NSLayoutConstraint.activate([
                    // view의 위치를 정하는 제약조건
                    //activate는 제약조건을 적용하라는 명령
                   
                    numLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
                    numLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                    
                    openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    openButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
                    openButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                    openButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
                    //openButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20)
                    openButton.heightAnchor.constraint(equalToConstant: 43),
                    
                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    imageView.widthAnchor.constraint(equalToConstant: 300),
                    imageView.heightAnchor.constraint(equalToConstant: 300),
                    
                    
                    loadButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                    loadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                    loadButton.widthAnchor.constraint(equalToConstant: 30),
                    loadButton.heightAnchor.constraint(equalToConstant: 30)

                    
                ])
            }
            @objc func buttonTapped() {
                if state == false {
                    openButton.setTitle("포춘 쿠키를 열어보세요!", for: .normal)
                    imageView.image = UIImage(named: "cookie")
                   // imageView.image = UIImage(named: "cookie")
                    state = true
                } else {
                    openButton.setTitle("다시하기", for: .normal)
                    imageView.image = UIImage(named: "open_cookie")
                    numCount -= 1
                    numLabel.text = "남은 포춘쿠키 : \(numCount)개"
                    state = false
                }
                    // if문에서 state == false? → 아니니까 else 실행
            }
            
            @objc func loadTapped() {
                numCount = 10
                numLabel.text = "남은 포춘쿠키 : \(numCount)개"
                openButton.setTitle("포춘 쿠키를 열어보세요!", for: .normal)
                imageView.image = UIImage(named: "cookie")
                state = true
                
            }

        }

        extension UIColor {
            
            convenience init(hexCode: String, alpha: CGFloat = 1.0) {
                var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
                
                if hexFormatted.hasPrefix("#") {
                    hexFormatted = String(hexFormatted.dropFirst())
                }
                
                assert(hexFormatted.count == 6, "Invalid hex code used.")
                
                var rgbValue: UInt64 = 0
                Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
                
                self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                          green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                          blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                          alpha: alpha)
            }
        }

