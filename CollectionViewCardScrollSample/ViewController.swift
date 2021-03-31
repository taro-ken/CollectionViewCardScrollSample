//
//  ViewController.swift
//  CollectionViewCardScrollSample
//
//  Created by 木元健太郎 on 2021/03/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var horizontalCollectionView: UICollectionView!
    

    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0 ..< 100 {
            number.append(String(i))
            
        }
        viewWidth = view.frame.width
                viewHeight = view.frame.height
                navHeight = self.navigationController?.navigationBar.frame.size.height

                horizontalCollectionView.delegate = self
                horizontalCollectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
                horizontalCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
                ]
    }

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return number.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowRadius = 12
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 8, height: 8)
        cell.layer.masksToBounds = false
        cell.titleLabel?.text = number[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellWidth = viewWidth-75
        cellHeight = viewHeight-300
        cellOffset = viewWidth-cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -navHeight,left: cellOffset/2,bottom: 0,right: cellOffset/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        // UIImagePickerController カメラを起動する
        present(picker, animated: true, completion: nil)
    }
    /// シャッターボタンを押下した際、確認メニューに切り替わる
    /// - Parameters:
    ///   - picker: ピッカー
    ///   - info: 写真情報
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] {
            
            // "写真を使用"を押下した際、写真アプリに保存する
            UIImageWriteToSavedPhotosAlbum(image as! UIImage, nil, nil, nil)
            // UIImagePickerController カメラが閉じる
            self.dismiss(animated: true, completion: nil)
        }
        
    }

   
        


}
