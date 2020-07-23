//
//  MeetingRoomListViewController.swift
//  MeetingRooms_
//
//  Created by SeoYeon on 2020/07/05.
//  Copyright © 2020 SeoYeon. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {
    
    var service:Service?
    /*
    var meetingRooms:[String:[String:Int]]=["Meeting":["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10], "Seminar":["Cezanne":20, "Matisse":30, "Renoir":40]]
    func meetingRoomsAtIndex(_ index:Int) -> (key: String, value: [String:Int]){
        let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        return orderedMeetingRooms[index]
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = service?.name
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //let categoryValues = Array(meetingRooms.values)[section]
        //let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        //section의 value에 대한 갯수를 리턴해주는 것
        //let rowCount = orderedMeetingRooms[section].1.count
        guard let rowCount = service?.items?.count else {
            return 0
        }
        return rowCount //section의 value에 대한 갯수를 리턴해주는 것
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        //let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        
        //let categoryValue = Array(meetingRooms.values)[indexPath.section]
        //let categoryValue = orderedMeetingRooms[indexPath.section].1
        /*
        let categoryValue = meetingRoomsAtIndex(indexPath.section).value
        
        let orderedCategoryValue = categoryValue.sorted(by:{$0.1<$1.1})
        let roomName = orderedCategoryValue[indexPath.row].0
        let capacity = orderedCategoryValue[indexPath.row].1
 */
        //let roomNames = Array(meetingRooms.keys)
        //let roomName = Array(categoryValue.keys)[indexPath.row]
        //let capacity = Array(categoryValue.values)[indexPath.row]
        guard let meetingRoom = service?.items?[indexPath.row] else {
            return cell
        }
        cell.textLabel!.text = meetingRoom.name
        cell.detailTextLabel!.text = String(meetingRoom.capacity)

        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        return meetingRoomsAtIndex(section).key
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //let orderedMeetingRooms = meetingRooms.sorted(by:{$0.1.first!.1 < $1.1.first!.1})
        let rowCount = meetingRoomsAtIndex(section).value.count
        return "\(rowCount) rooms"
    }
 */
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
