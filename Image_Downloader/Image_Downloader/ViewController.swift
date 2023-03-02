//
//  ViewController.swift
//  Image_Downloader
//
//  Created by Hyeongjung on 2023/03/02.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var imageView = UIImageView()
    var button = UIButton()
    var vStackView = UIStackView()
    var hStackView1 = UIView()
    var hStackView2 = UIView()
    var hStackView3 = UIView()
    var hStackView4 = UIView()
    var hStackView5 = UIView()
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    var imageView4 = UIImageView()
    var imageView5 = UIImageView()
    var imageButton1 = UIButton()
    var imageButton2 = UIButton()
    var imageButton3 = UIButton()
    var imageButton4 = UIButton()
    var imageButton5 = UIButton()
    var progressBar1 = UIProgressView()
    var progressBar2 = UIProgressView()
    var progressBar3 = UIProgressView()
    var progressBar4 = UIProgressView()
    var progressBar5 = UIProgressView()
    
    let url1 = URL(string: "https://img.theqoo.net/img/sVJDV.jpg")
    let url2 = URL(string: "https://fimg5.pann.com/new/download.jsp?FileID=55160461")
    let url3 = URL(string: "https://t1.daumcdn.net/cfile/tistory/99100E425E69C6CB18")
    let url4 = URL(string: "https://img.bntnews.co.kr/data/bnt/image/2022/08/19/bnt202208190128.680x.0.jpg")
    let url5 = URL(string: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/18/htm_20170218114544126552.jpg")

    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
        addData()
        setLayout()
        
//        let url = URL(string: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/18/htm_20170218114544126552.jpg")
//        imageView1.load(url: url!)
    }
    private func addLayout() {
        [button, vStackView].forEach { view.addSubview($0) }
        [hStackView1, hStackView2, hStackView3, hStackView4, hStackView5].forEach { vStackView.addArrangedSubview($0) }
        [imageView1, progressBar1, imageButton1].forEach { hStackView1.addSubview($0) }
        [imageView2, progressBar2, imageButton2].forEach { hStackView2.addSubview($0) }
        [imageView3, progressBar3, imageButton3].forEach { hStackView3.addSubview($0) }
        [imageView4, progressBar4, imageButton4].forEach { hStackView4.addSubview($0) }
        [imageView5, progressBar5, imageButton5].forEach { hStackView5.addSubview($0) }
        
    }
    private func addData() {
        view.backgroundColor = .white
        vStackView.backgroundColor = .white
        
        [progressBar1, progressBar2, progressBar3, progressBar4, progressBar5].forEach {
            $0.progress = 0.5
            $0.tintColor = .systemBlue
            $0.trackTintColor = .systemGray
        }
        [imageView1, imageView2, imageView3, imageView4, imageView5].forEach {
            $0.image = UIImage(systemName: "photo")
            $0.contentMode = .scaleAspectFit
        }
        [button, imageButton1, imageButton2, imageButton3, imageButton4, imageButton5].forEach {
            $0.backgroundColor = .systemBlue
            $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        }
        
    }
    
    private func setLayout() {
        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setTitle("Load All Images", for: .normal)
        
        vStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(button.snp.top).offset(-30)
        }
        
        vStackView.axis = .vertical
        vStackView.alignment = .leading
        vStackView.distribution = .fillEqually
        
        hStackView1.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        hStackView2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        hStackView3.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        hStackView4.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        hStackView5.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        [imageView1, imageView2, imageView3, imageView4, imageView5].forEach { imageview in
            imageview.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(30)
                $0.width.equalTo(90)
                $0.height.equalTo(70)
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
        
        progressBar1.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(imageButton1.snp.leading)
            $0.leading.equalTo(imageView1.snp.trailing).offset(30)
            $0.height.equalTo(5)
        }
        progressBar2.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(imageButton2.snp.leading)
            $0.leading.equalTo(imageView2.snp.trailing).offset(30)
            $0.height.equalTo(5)
        }
        progressBar3.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(imageButton3.snp.leading)
            $0.leading.equalTo(imageView3.snp.trailing).offset(30)
            $0.height.equalTo(5)
        }
        progressBar4.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(imageButton4.snp.leading)
            $0.leading.equalTo(imageView4.snp.trailing).offset(30)
            $0.height.equalTo(5)
        }
        progressBar5.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(imageButton5.snp.leading)
            $0.leading.equalTo(imageView5.snp.trailing).offset(30)
            $0.height.equalTo(5)
        }
    }
    
    @objc func tapButton(button: UIButton) {
        if button == imageButton1 {
            imageView1.image = UIImage(systemName: "photo")
            imageView1.load(url: url1!)
        } else if button == imageButton2 {
            imageView2.image = UIImage(systemName: "photo")
            imageView2.load(url: url2!)
        } else if button == imageButton3 {
            imageView3.image = UIImage(systemName: "photo")
            imageView3.load(url: url3!)
        } else if button == imageButton4 {
            imageView4.image = UIImage(systemName: "photo")
            imageView4.load(url: url4!)
        } else if button == imageButton5 {
            imageView5.image = UIImage(systemName: "photo")
            imageView5.load(url: url5!)
        } else {
            [imageView1, imageView2, imageView3, imageView4, imageView5].forEach { $0.image = UIImage(systemName: "photo") }
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

