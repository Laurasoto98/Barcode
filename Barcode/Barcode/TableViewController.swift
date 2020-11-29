//
//  TableViewController.swift
//  Barcode
//
//  Created by Laura Soto on 11/4/20.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {

    
    let data = ["Aerosol cans -> No, take to a Home Chemical Collection Center for safe disposal", "Aluminum cans -> Yes", "Aseptic containers -> Yes", "Batteries -> No, take to a Home Chemical Collection Center", "Books -> Yes", "Glass and Plastic Bottles -> Yes", "Light bulbs -> No", "Butter tubs -> No", "Steel and Aluminum Cans -> Yes", "Cardboard -> Yes", "Cartons -> Yes", "Cartridges -> No, take to a Home Chemical Collection Center", "Ceramics -> No", "Chemicals -> No, take to a Home Chemical Collection Center","Christmas lights -> No", "Clothing -> No", "Cooking oil -> Compost", "Documents -> Yes", "Plastic Barrels -> No, accepted at Department of Solid Waste Management landfills", "Metal Barrels -> Accepted at local scrap metal yards", "Paper egg Cartons -> Yes", "Plastic or Foam Egg Cartons -> No", "Electronics -> No, take to Home Chemical Collection Center", "Eyeglasses -> No", "Fencing -> No, schedule a Busy waste pickup", "Foam -> No", "Furniture -> No, request a Bulky waste pickup", "Garden hoses -> No", "Gas cans -> No, take to a Home Chemical Collection Center", "Glass food containers -> No", "Glass bottles -> Yes", "Hangers -> No", "Ink Cartridges -> No, take to a Home Chemical Collection Center", "Juice pouches -> No", "Kitchen appliances -> No, take to a Home Chemical Collection Center", "Latex -> No",  "Magazines -> Yes", "Medicine bottles -> No", "Motor oil -> No, take to a Home Chemical Collection Center", "Newspaper -> Yes", "Oil filters -> No, take to a Home Chemical Collection Center", "Paint -> No, take to a Home Chemical Collection Center", "Packing Materials -> No, take to a Home Chemical Collection Center", "Paper -> Yes", "Phone books -> Yes", "Pizza boxes -> No", "Plastic bags -> No", "Plastic bottles -> Yes", "Plastic cups -> No", "Plastic plant pots -> No", "Plastic plates -> No", "Plastic utensils -> No", "Rubber gloves -> No", "Steel cans -> Yes", "Tea bags -> Compost", "Toilet paper rolls -> Yes", "USB cords -> No, take to a Home Chemical Collection Center", "Vacuum bags -> No", "Wax paper -> No", "Yard waste -> Compost", "Yogurt cups -> No", "Zip lock bags -> No"]
    var products = ProductCatalog()
    let data2 = searchList()
    
    var filteredData: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredData = data
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }

    //MARK search bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredData = []
        if searchText == ""{
            filteredData = data
        }
        else{
            for item in data{
                if item.lowercased().contains(searchText.lowercased()){
                    filteredData.append(item)
                }
            }
        }
        self.tableView.reloadData()
    }
}
