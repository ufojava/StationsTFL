//
//  ContentView.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 02/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
        
                ZStack {
                    
                    //Background
                    Image("TubeLineBackGround")
                        .resizable()
                        .scaledToFill()
                    .padding()
                        
                    Menu()
                    
                    //Text("Hello, World!")
                   //AllStationRecords()
                    
                    
                    
                }
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



