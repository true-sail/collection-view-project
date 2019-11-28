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
        collectionView.dataSource = self
        collectionView.delegate = self
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
        
        // セルの中のLabelをタグ番号で取得&文字の設定
        let label = cell.contentView.viewWithTag(2) as! UILabel
        
        label.text = "Hello World"
        
        // 出来上がったセルを返す
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("クリックされたよ")
        
    }
    
}

// コレクションビューのデザインを調整するための拡張
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 画像の幅を取得
        let screenSiza = self.view.bounds.width
        
        // 画面の幅の半分を計算
        let cellSize = screenSiza / 2 - 5
        
        return CGSize(width: cellSize, height: cellSize)
    }
}
