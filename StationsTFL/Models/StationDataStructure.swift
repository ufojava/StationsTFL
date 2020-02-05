//
//  StationDataStructure.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 02/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Data Structure for Stations
import SwiftUI




struct Stations: Codable, Identifiable {
    
    
    public var id: Int
    
    public var tla: String
    public var name:    String
    public var lines:   [String]

        
}


struct TubeLines: Codable {
    
    let lines:  [String]
    
}

