//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by 家田真帆 on 2019/11/28.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
let images = ["dog", "kame", "ahiru", "kappa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // コレクションビューに表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    // コレクションビューのセルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // セルを取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // セルの中のImageViewをタグ番号（imageViewを選択して右のバーで1にする）で取得&画像の設定
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        
               imageView.image = UIImage(named: images[indexPath.row])
        // 出来上がったセルを返す
        return cell
    }
    
   
    
}
