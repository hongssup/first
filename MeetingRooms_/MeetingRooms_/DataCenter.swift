//
//  DataCenter.swift
//  MeetingRooms_
//
//  Created by SeoYeon on 2020/07/08.
//  Copyright © 2020 SeoYeon. All rights reserved.
//

import Foundation

let dataCenter:DataCenter = DataCenter()

class DataCenter {
    var branches:[Branch] = []
    
    init() {
        let banksyRoom = MeetingRoom(name: "Banksy", capacity: 4)
        let kahloRoom = MeetingRoom(name: "Kahlo", capacity: 8)
        let riveraRoom = MeetingRoom(name: "Rivera", capacity: 8)
        let picassoRoom = MeetingRoom(name: "Picasso", capacity: 10)
        
        let vehicleService = Service(name: "차량예약")
        let meetingRoomService = Service(name: "회의실예약")
        let visitorService = Service(name: "방문자예약")
        let deskService = Service(name: "데스크예약")
        meetingRoomService.items = [banksyRoom, kahloRoom, riveraRoom, picassoRoom]
        
        let pangyoBranch = Branch(name: "판교점")
        let samsungBranch = Branch(name: "삼성점")
        let yeoksamBranch = Branch(name: "역삼점")
        let sinrimBranch = Branch(name: "신림점")
        let songdoBranch = Branch(name: "송도점")
        let anamBranch = Branch(name: "혜화점")
        pangyoBranch.services = [vehicleService, meetingRoomService, visitorService, deskService]
        
        branches += [pangyoBranch, samsungBranch, yeoksamBranch, sinrimBranch, songdoBranch, anamBranch]
    }
}

class Branch {
    let name: String
    var services:[Service]?
    
    init(name:String) {
        self.name = name
    }
}

class Service {
    let name:String
    var items:[MeetingRoom]?
    
    init(name:String) {
        self.name = name
    }
}

class MeetingRoom {
    let name:String
    let capacity:Int
    
    init(name:String, capacity:Int){
        self.name = name
        self.capacity = capacity
    }
}
