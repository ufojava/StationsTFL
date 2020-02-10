//
//  SearchRecords.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 07/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI


//Struct file to search for specific records


struct SearchRecords: View {
    
    //Json Data
    @ObservedObject var allStations = DataLoader()
    
 
    
    //Variable to take read search
    @State private var searchStation = ""

    
    //Environment Variable
    @EnvironmentObject var mapCoordinates: CoordinateLongLat
   
    
    func openMap() -> some View {
        
        NavigationLink(destination: MapView().edgesIgnoringSafeArea(.all)) {
                                                              EmptyView()
                                                           }
        
    }
    
    
    
    var body: some View {
        
                    VStack {
                    
                        
                        
                                    TextField("Enter Station",text: $searchStation)
                                        .disableAutocorrection(true)
                                        .foregroundColor(Color.blue)
                                        .padding()
                                
                                        
                                
                                List {
                                    
                                    
                                        ForEach(allStations.dataStructure.filter {$0.name.contains(self.searchStation)},id:  \.id) { station in
                                            
                                           
                                            VStack(alignment: .leading, spacing: 10) {
                                                
                                                HStack {
                                                    Text("\(station.name)")
                                                    
                                                    Button(action: {
                                                        
                                                        self.mapCoordinates.latitude = station.latitude
                                                        self.mapCoordinates.longitude = station.longitude
                                                        self.mapCoordinates.name = station.name
                                                        
                                                    }) {
                                                    
                                                        Text("Details...")
                                                            .font(.system(size: 14))
                                                            .foregroundColor(Color.blue)
                                                        
                        
                                                    }
                                                    NavigationLink(destination: MapView().edgesIgnoringSafeArea(.all)) {
                                                            EmptyView()
                                                                                                           
                                                                                                              
                                                    }
                                                        
                                                    
                                                  
                                           
                                                    
                                                }.foregroundColor(Color.green)
                                                    
                                                
                                                
                                            ForEach(station.lines,id: \.self) { line in
                                                
                                                
                                                GeometryReader {geometry in
                                                       
                                                
                                                HStack(spacing: 0) {
                                                    
                                                    
                                                    
                                                Text("\(line)")
                                                    .frame(width: geometry.size.width / 2, height: 20)
                                                   
                                                
                                                Image("\(line)")
                                                    .resizable()
                                                    .frame(width: geometry.size.width / 3, height: 20)
                                                    .cornerRadius(2)
                                                    
                                                  
                                                
                                            
                                                    }
                                            
                                                }
                                                }
                                            }//End of line Foreach
                                        
                                        
                                        
                                        }//End of Main foreach
                            
                            
                            
                            
                                }//End of List
                            
                                    .navigationBarTitle(Text("Station Search"),displayMode: .inline)
                        
                    }//End of VStack
        
    }
}
    
    


//Preview Search REcords
struct SearchRecords_Preview: PreviewProvider {
    
    static var previews: some View {
        
        SearchRecords()
        
    }
}
