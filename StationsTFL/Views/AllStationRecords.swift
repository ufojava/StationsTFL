//
//  AllStationRecords.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 03/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//This file contains struct that produces all records
import SwiftUI



struct AllStationRecords: View {
    
    //Access to Station Data
    @ObservedObject var allStations = DataLoader()
    

    

    
    var body: some View {
        
        NavigationView {
            
            
        
            
                
                
            List {
                    
                ForEach(allStations.dataStructure) {model in
                    Section(header: Text("\(model.name)")) {
                    
                        ForEach(self.allStations.dataStructure.filter {$0.name == model.name},id: \.id) { lineData in
                        
                        ForEach(lineData.lines,id: \.self) { line in
                            
                        Text("\(line)")
                            
                            
                        }
                        
                    }
                        
                        
                    }
        
                
                }
                

                
                
        
                
        }

       
        }
            
        }
        
    }







//Preview to All records
struct AllStationRecords_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AllStationRecords()
        
        
    }
    
}

