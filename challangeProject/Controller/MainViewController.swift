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
    
    
    var countryArray : [String] = []
    var selectedIndex = ""
    var model = [ProjectModel]()
    let imageArray : [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: "CollectionViewCell")
        
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
         
            } catch  {
                print(error)
            }
        }.resume()
        
         self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            
            let destinationVC = segue.destination as!  DetailViewController
            
            destinationVC.selectedCountry = selectedIndex
            
        }
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
   
      //  cell.imageCell.image = imageArray[indexPath.row]
        cell.labelCell.text = "\(model[indexPath.row].blurb)"
   
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     //   selectedIndex = "\(countryArray[indexPath.row])"
        
        performSegue(withIdentifier: "toDetailVC", sender: self)
        
    }
    
}



