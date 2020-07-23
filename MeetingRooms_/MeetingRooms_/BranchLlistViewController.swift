//
//  BranchLlistViewController.swift
//  MeetingRooms_
//
//  Created by SeoYeon on 2020/07/09.
//  Copyright © 2020 SeoYeon. All rights reserved.
//
// 지점 목록을 보여주는 table view의 관리자
import UIKit

class BranchLlistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = dataCenter.branches.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath)

        let branch = dataCenter.branches[indexPath.row]
        cell.textLabel?.text = branch.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         if segue.identifier == "ServiceSegue" {
            //if let 쉼표료 연결해서 쓸 수 있음??????
            if let destination = segue.destination as? ServiceListViewController , selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.branch = dataCenter.branches[selectedIndex] as Branch
                }
            
        }
         */
        if segue.identifier == "ServiceSegue" {
            //destination이 서비스리스트뷰컨트롤러라면
            if let destination = segue.destination as? ServiceListViewController {
                // selectedIndex가 있다면
                if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.branch = dataCenter.branches[selectedIndex] as Branch
                }
            }
        }
        
    }
    

}
