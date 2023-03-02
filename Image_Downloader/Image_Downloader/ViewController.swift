//
//  ViewController.swift
//  Image_Downloader
//
//  Created by Hyeongjung on 2023/03/02.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let loadAllButton = UIButton()
    var vStackView = UIStackView()
    let hStackView1 = UIView()
    let hStackView2 = UIView()
    let hStackView3 = UIView()
    let hStackView4 = UIView()
    let hStackView5 = UIView()
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let imageView4 = UIImageView()
    let imageView5 = UIImageView()
    let progressBar1 = UIProgressView()
    let progressBar2 = UIProgressView()
    let progressBar3 = UIProgressView()
    let progressBar4 = UIProgressView()
    let progressBar5 = UIProgressView()
    let imageButton1 = UIButton()
    let imageButton2 = UIButton()
    let imageButton3 = UIButton()
    let imageButton4 = UIButton()
    let imageButton5 = UIButton()
    
    let url1 = URL(string: "https://img.theqoo.net/img/sVJDV.jpg")
    let url2 = URL(string: "https://cdn.clien.net/web/api/file/F01/11047364/76da0c8f7eb022.jpg?w=850&h=30000")
    let url3 = URL(string: "https://a-static.besthdwallpaper.com/itzy-s-gorgeous-member-yuna-wallpaper-3554x1999-61255_53.jpg")
    let url4 = URL(string: "https://img.bntnews.co.kr/data/bnt/image/2022/08/19/bnt202208190128.680x.0.jpg")
    let url5 = URL(string: "https://photo.coolenjoy.co.kr/data/editor/1608/Bimg_20160810211959_kmdytkeb.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
        addData()
        setLayout()
    }
    
    private func addLayout() {
        [loadAllButton, vStackView].forEach { view.addSubview($0) }
        [hStackView1, hStackView2, hStackView3, hStackView4, hStackView5].forEach { vStackView.addArrangedSubview($0) }
        [imageView1, progressBar1, imageButton1].forEach { hStackView1.addSubview($0) }
        [imageView2, progressBar2, imageButton2].forEach { hStackView2.addSubview($0) }
        [imageView3, progressBar3, imageButton3].forEach { hStackView3.addSubview($0) }
        [imageView4, progressBar4, imageButton4].forEach { hStackView4.addSubview($0) }
        [imageView5, progressBar5, imageButton5].forEach { hStackView5.addSubview($0) }
    }
    
    private func addData() {
        [progressBar1, progressBar2, progressBar3, progressBar4, progressBar5].forEach {
            $0.progress = 0.5
            $0.tintColor = .systemBlue
            $0.trackTintColor = .systemGray
        }
        [imageView1, imageView2, imageView3, imageView4, imageView5].forEach {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(systemName: "photo")
        }
        [loadAllButton, imageButton1, imageButton2, imageButton3, imageButton4, imageButton5].forEach {
            $0.backgroundColor = .systemBlue
            $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        loadAllButton.clipsToBounds = true
        loadAllButton.layer.cornerRadius = 10
        loadAllButton.setTitle("Load All Images", for: .normal)
        loadAllButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(loadAllButton.snp.top).offset(-30)
        }
        
        [hStackView1, hStackView2, hStackView3, hStackView4, hStackView5].forEach { stackview in
            stackview.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview()
            }
        }
        
        [imageView1, imageView2, imageView3, imageView4, imageView5].forEach { imageview in
            imageview.snp.makeConstraints {
                $0.top.leading.bottom.centerY.equalToSuperview()
                $0.width.equalTo(140)
            }
        }
        [imageButton1, imageButton2, imageButton3, imageButton4, imageButton5].forEach { imagebutton in
            imagebutton.clipsToBounds = true
            imagebutton.layer.cornerRadius = 10
            imagebutton.setTitle("Load", for: .normal)
            imagebutton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.width.equalTo(70)
                $0.height.equalTo(40)
            }
        }
        [progressBar1, progressBar2, progressBar3, progressBar4, progressBar5].forEach { bar in
            var button = UIButton()
            var imageview = UIImageView()
            switch bar {
            case progressBar1:
                button = imageButton1
                imageview = imageView1
            case progressBar2:
                button = imageButton2
                imageview = imageView2
            case progressBar3:
                button = imageButton3
                imageview = imageView3
            case progressBar4:
                button = imageButton4
                imageview = imageView4
            case progressBar5:
                button = imageButton5
                imageview = imageView5
            default:
                break
            }
            bar.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalTo(button.snp.leading)
                $0.leading.equalTo(imageview.snp.trailing).offset(30)
                $0.height.equalTo(5)
            }
        }
    }
    
    @objc func tapButton(button: UIButton) {
        switch button {
        case imageButton1: imageView1.load(url: url1!)
        case imageButton2: imageView2.load(url: url2!)
        case imageButton3: imageView3.load(url: url3!)
        case imageButton4: imageView4.load(url: url4!)
        case imageButton5: imageView5.load(url: url5!)
        default:
            imageView1.load(url: url1!)
            imageView2.load(url: url2!)
            imageView3.load(url: url3!)
            imageView4.load(url: url4!)
            imageView5.load(url: url5!)
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        self.image = UIImage(systemName: "photo")
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

