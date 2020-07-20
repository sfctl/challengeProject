//
//  ViewController.swift
//  challangeProject
//
//  Created by Yasemin YEL on 13.07.2020.
//  Copyright © 2020 Sifa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MainViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var chosenItem : ProjectModel?
    var model = [ProjectModel]()
  //  let imageArray : [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.makeShadow()
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width) * 0.4, height: (self.collectionView.frame.size.height)*0.4)
        layout.scrollDirection = .vertical
        
        
        fetchData()
        
    }
    
    func fetchData(){
        
        guard let url = URL(string: "http://starlord.hackerearth.com/kickstarter")
            
            else { return }
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                
                self.model = try decoder.decode([ProjectModel].self, from: data)
                // print(self.model[0].title)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch  {
                print(error)
            }    
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            
            let destinationVC = segue.destination as!  DetailViewController
            
            destinationVC.selectedItem = chosenItem
           
        }
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.imageCell.image = UIImage(named: "2")
        cell.titleLabel.text = "\(model[indexPath.row].title)"
        cell.subtitleLabel.text = "\(model[indexPath.row].by)"
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        chosenItem = model[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: self)
        
    }
    
}



