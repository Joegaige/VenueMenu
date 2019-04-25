//
//  MyViewController.swift
//  VenueMenu
//
//  Created by Nicholai Cascio on 4/25/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var items = [Item]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parseItems()
    }
    
    func parseItems(){
        let url = Bundle.main.url(forResource:"Data", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        self.items = try! JSONDecoder().decode([Item].self, from: jsonData)
        print(items.count)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let item = items[indexPath.row]
        cell.textLabel!.text = item.name
        cell.detailTextLabel?.text = item.description
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
