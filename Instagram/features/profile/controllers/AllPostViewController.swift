//
//  AllPostViewController.swift
//  Instagram
//
//  Created by apple on 10/05/2023.
//

import UIKit

class AllPostViewController: UIViewController {
    
    private var dataset = [AllPostResponse]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataset = [
            AllPostResponse(likes: 4, views: 10, imageUrl: "https://pixabay.com/get/g5111c34b90198299426c6d888cfc1b015c5cfbe4fdae59581136daca1ac670afd607c3fd31c9f1f133f02bb5ebbf67497b7670055acdf3b74bbced66a11a68e4_1280.jpg", webUrl: "", username: "Ovais"),
            AllPostResponse(likes: 4, views: 100, imageUrl: "https://pixabay.com/get/g65d6cc1a1c9975c656a1cdab7f0d1ec597acf0f2102d76dff53c73b2b3dce59a154a3a5199c9f798ce50e231d2081d29ccd85335bf2036ad5bedf33661f10395_640.jpg", webUrl: "", username: "Ovais"),
            AllPostResponse(likes: 4, views: 10, imageUrl: "https://pixabay.com/get/gb66e9123d13104af49d37ba966aca0af1bf30e712bff48c6729c8ffd8ea92c55f5df0a4cad9fbeb2f9e3338dcecadf5ea779d8c6dbfb7eaf83df640563e6ce4e_640.jpg", webUrl: "", username: "Ovais"),
            AllPostResponse(likes: 4, views: 10, imageUrl: "https://pixabay.com/get/g65d6cc1a1c9975c656a1cdab7f0d1ec597acf0f2102d76dff53c73b2b3dce59a154a3a5199c9f798ce50e231d2081d29ccd85335bf2036ad5bedf33661f10395_640.jpg", webUrl: "", username: "Ovais"),
            AllPostResponse(likes: 4, views: 10, imageUrl: "https://pixabay.com/get/gb66e9123d13104af49d37ba966aca0af1bf30e712bff48c6729c8ffd8ea92c55f5df0a4cad9fbeb2f9e3338dcecadf5ea779d8c6dbfb7eaf83df640563e6ce4e_640.jpg", webUrl: "", username: "Ovais")
        ]
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
}

extension AllPostViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        let allPosts = dataset[indexPath.row]
        let url = URL(string: allPosts.imageUrl ?? "")
            do {
                if let imageURL = url {
                    imageURL.asyncDownload { data, response, error in
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                cell.cityImageView.image = image
                            }
                        }
                    }
                }
            }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
