//
//  ServiceListViewController.swift
//  MeetingRooms_
//
//  Created by SeoYeon on 2020/07/09.
//  Copyright © 2020 SeoYeon. All rights reserved.
//

import UIKit

class ServiceListViewController: UITableViewController {
    
    var branch:Branch?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = branch?.name
        self.navigationItem.title = "\(branch!.name) 정보"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // if let 보다 guard let 을 쓰는 것이 더 좋음. 예외 상황 처리해주고 그 외엔 상위 블록에서 처리할 수 있도록? (if let은 특정 상황에서만 구현. guard let은 정상적이지 않은 상황 필터아웃.
        guard let rowCount = branch?.services?.count else {
            return 0
        }
        return rowCount    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)
        // 서비스가 없는 상황을 예외처리 
        guard let service = branch?.services?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = service.name
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
    if segue.identifier == "MeetingRoomSegue" {
        if let destination = segue.destination as? MeetingRoomListViewController {
            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                destination.service = branch?.services?[selectedIndex]
            }
            
        }
    }
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MeetingRoomSegue" {
            guard let destination = segue.destination as? MeetingRoomListViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let service = branch?.services?[selectedIndex] else {
                print("x")
                return
            }
            destination.service = service
            print("O")
        }
    }
     */
}
