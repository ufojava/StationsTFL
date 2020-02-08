//
//  Menu.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 06/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Menu Layout
import SwiftUI


struct Menu: View {
    
    //Menu Toggle
    @State private var allStationToggle = false
    @State private var searchStationToggle = false
    @State private var stationStatsToggle = false
    
    
    var body: some View {
        
        VStack {
            
            
            Spacer()
            Image("LondonUnderground")
                .resizable()
                .scaledToFill()
                .frame(width:180, height: 280)
            
            Spacer()
            //Horizontal Bar
            HStack {
                
                
                Button(action: {
                    
                    self.showSubMenu()
                    
                }) {
                    
                    MenuIcons(icons: "plus.square")
                    .foregroundColor((Color.purple))
                    
                    
                    
                }
          
                
                    //Menu Trigger
                 
                        
                        
                        //All Station List
                        if allStationToggle {
                            
                            //Navigation Link
                            NavigationLink(destination: AllStationRecords()) {
                            
                            MenuIcons(icons: "book")
                                .foregroundColor(Color.green)
                            
                            
                            }
                            
                            
                        }//End All Station
                        
                        
                        //Search Station List
                        if searchStationToggle {
                            
                            //Navigation Link
                            NavigationLink(destination: SearchRecords()) {
                            
                            MenuIcons(icons: "doc.text.magnifyingglass")
                                .foregroundColor(Color.yellow)
                            
                            }
                        }
                
                        //Station Stats
                if stationStatsToggle {
                    
                    MenuIcons(icons: "gamecontroller")
                        .foregroundColor(Color.blue)
                }
                        
            
            }//End of HStack
        
        
        }//End of VStack
        
    }
    
    //Function to toggle
    func showSubMenu() {
        
        //All Station
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            withAnimation {
                
                self.allStationToggle.toggle()
            }
        }//All Station
        
        //Search Station
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            withAnimation {
                self.searchStationToggle.toggle()
                
            }
        }//End Search
        
        //Station Stats
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            withAnimation {
                self.stationStatsToggle.toggle()
            }
        }//End Station Stats
        
        
        
    }
    
    
    
    
}


//Set PreViews

struct Menu_Previews: PreviewProvider {
    
    static var previews: some View {
        Menu()
        
    }
}






//Menu Icons Construct
struct MenuIcons: View {
    
    var icons: String
    
    
    var body: some View {
        
        Image(systemName: icons)
            .resizable()
            .frame(width: 40, height: 40)
            .shadow(color: .black, radius: 0.3, x: 1, y: 1)
        
        
        
    }
}
