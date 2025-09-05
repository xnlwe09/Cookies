//
//  ViewController.swift
//  Cookie
//
//  Created by 신주희 on 9/4/25.
//

import UIKit
import SnapKit
import Then

        class MyViewController: UIViewController {
            
            let numLabel = UILabel().then {
                $0.text = "남은 포춘쿠키 : 10개"
                $0.textColor = .black
                //numLabel.translatesAutoresizingMaskIntoConstraints = false
                //Auto Layout 쓴다고 알리는 거임
                $0.font = UIFont.systemFont(ofSize: 13)
            }
            
            let openButton = UIButton().then {
                $0.setTitle("포춘 쿠키를 열어보세요!", for: .normal)
                $0.titleLabel?.textColor = .white
                $0.backgroundColor = UIColor(hexCode: "FFB266")
                //openButton.translatesAutoresizingMaskIntoConstraints = false
                $0.layer.cornerRadius = 5
            }
            
            let imageView = UIImageView().then {
                $0.image = UIImage(named: "cookie")
                //imageView.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let loadButton = UIButton().then {
                $0.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
                $0.tintColor = UIColor(hexCode: "FFB266")
                //loadButton.translatesAutoresizingMaskIntoConstraints = false
                $0.contentVerticalAlignment = .fill
                $0.contentHorizontalAlignment = .fill
            }
            
            var numCount: Int = 10
            var state: Bool = true

            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = UIColor(hexCode: "FDF5Ed")
                
                openButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                loadButton.addTarget(self, action: #selector(loadTapped), for: .touchUpInside)

            
                view.addSubview(numLabel) //view에 label 추가
                view.addSubview(openButton)
                view.addSubview(imageView)
                view.addSubview(loadButton)
                
                    //Auto Layout
                
                 //  NSLayoutConstraint.activate([
                    // view의 위치를 정하는 제약조건
                    //activate는 제약조건을 적용하라는 명령
                   
                    //numLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
                    //numLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                    numLabel.snp.makeConstraints {
                        $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
                        $0.right.equalToSuperview().offset(-20) // = offset(20)
                    }
                    
//                    openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    openButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
//                    openButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//                    openButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//                    openButton.heightAnchor.constraint(equalToConstant: 43),
//
                    openButton.snp.makeConstraints {
                        $0.centerX.equalToSuperview()
                        $0.bottom.equalToSuperview().inset(40)
                        $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
                        $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
                        $0.height.equalTo(43)
                    }
                
                
//                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                    imageView.widthAnchor.constraint(equalToConstant: 300),
//                    imageView.heightAnchor.constraint(equalToConstant: 300),
                    imageView.snp.makeConstraints {
                        $0.center.equalToSuperview()
                        $0.width.height.equalTo(300)
                        //$0.size.equalTo(CGSize(width: 300, height: 300))
                }
                    
                    
//                    loadButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
//                    loadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//                    loadButton.widthAnchor.constraint(equalToConstant: 30),
//                    loadButton.heightAnchor.constraint(equalToConstant: 30)
                    loadButton.snp.makeConstraints {
                        $0.top.equalTo(view.safeAreaLayoutGuide).inset(5)
                        $0.leading.equalToSuperview().inset(10)
                        $0.width.height.equalTo(30)
                        //$0.size.equalTo(CGSize(width: 30, height: 30))
                }

                    updateNumLabel()
              //  ])
            }
            @objc func buttonTapped() {
                if state == false {
                    openButton.setTitle("포춘 쿠키를 열어보세요!", for: .normal)
                    imageView.image = UIImage(named: "cookie")
                    state = true
                } else {
                    openButton.setTitle("다시하기", for: .normal)
                    imageView.image = UIImage(named: "open_cookie")
                    numCount -= 1
                    updateNumLabel()
                    //numLabel.text = "남은 포춘쿠키 : \(numCount)개"
                    state = false
                }
                    // if문에서 state == false? → 아니니까 else 실행
            }
            
            @objc func loadTapped() {
                numCount = 10
                updateNumLabel()
                //numLabel.text = "남은 포춘쿠키 : \(numCount)개"
                openButton.setTitle("포춘 쿠키를 열어보세요!", for: .normal)
                imageView.image = UIImage(named: "cookie")
                state = true
                
            }
            
            private func updateNumLabel() {
                numLabel.text = "남은 포춘쿠키 : \(numCount)개"
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

