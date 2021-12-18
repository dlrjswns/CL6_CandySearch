//
//  MainSearchViewController.swift
//  CL6_CandySearch
//
//  Created by 이건준 on 2021/12/18.
//

import UIKit

private let reuseIdentifier = "cell"
class MainSearchViewController:UITableViewController{
    //MARK: -Property
    let candies:[Candy] = ForCandy.getCandies() // Get candy at Model
    
    private lazy var searchbarController:UISearchController = {
       let sb = UISearchController(searchResultsController: nil)
        
        return sb
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setNavigationBar()
    }
    
    //MARK: -Set navigationBar
    func setNavigationBar(){ //이 부분을 proxy로 뺄지, 추후에 변경사항
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "candyLogo.png"))
        
        self.navigationItem.searchController = searchbarController
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemBackground
        
        
    }
}

//MARK: -UITableViewDataSource
extension MainSearchViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        cell.textLabel?.text = candies[indexPath.row].candyName
        cell.detailTextLabel?.text = candies[indexPath.row].candyType
        return cell
    }
}
