//
//  ViewController.swift
//  UICollectionViewInsideUitableViewCell
//
//  Created by Aman Aggarwal on 27/09/19.
//  Copyright © 2019 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tbleList: UITableView!
    var list = [[Dictionary<String, Any>]]()
    
    //MARK:- setDatSourceForCollectionView
    func setDatSourceForCollectionView() {
        for _ in 0...4 {
            var cellArray = [Dictionary<String, Any>]()
            for i in 0...8 {
                var dict = Dictionary<String, Any>()
                if i%2 == 0 {
                    dict.updateValue( UIColor.red, forKey: "color")
                } else {
                    dict.updateValue( UIColor.yellow, forKey: "color")
                }
                cellArray.append(dict)
            }
            list.append(cellArray)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDatSourceForCollectionView()
        tbleList.tableFooterView = UIView(frame: .zero)
        tbleList.register(UINib(nibName: "CollectionviewTableCell", bundle: nil), forCellReuseIdentifier: "CollectionviewTableCell")
        tbleList.dataSource = self
        tbleList.delegate = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionviewTableCell") as! CollectionviewTableCell
        cell.infoArray = list[indexPath.row]
        cell.setUpDataSource()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }

}

