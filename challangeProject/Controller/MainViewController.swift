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


class ViewController: UIViewController {

    @IBOutlet weak var bgview: UIView!
    var countryArray : [String] = []

    
    @IBOutlet weak var collectionView: UICollectionView!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: "CollectionViewCell")
         
        fetchData()
            
        }
    
    
        func fetchData(){
            
            
            let request = AF.request("http://starlord.hackerearth.com/kickstarter")
            
            request.responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    self.countryArray.removeAll()
                    
                    for (_, subJson) in json {
                        
                        if let country = subJson["country"].string {
                            
                            self.countryArray.append(country)
                            
                        }
                        
                        self.collectionView.reloadData()
                        
                    }
                    
                case.failure(let error):
                    print(error)
                }
            }
            
        }
        

    
      
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "to detailVC", sender: nil)
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
            if segue.identifier == "to detailVC" {
                
                let destinationVC = segue.destination as!  DetailViewController
                
                destinationVC.selectedCountry = countryArray[indexPath.row]
                
                
            }
            
        }
        
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.labelCell.text = countryArray[indexPath.row]
        
        return cell
    }
    
    
}



