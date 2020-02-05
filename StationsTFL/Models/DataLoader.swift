//
//  DataLoader.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 02/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import Foundation

/*
 This class is responsible to decoding JSON file
 It will utilise the data structure - StationDataStructure
 */
public class DataLoader: ObservableObject {
    
    @Published var dataStructure = [Stations]()
    
    //Insert initilize load Data
    
    init() {
        
        //Decode File
        decodeJSONFile()
        
        //Sorted Data
        //sortData()
        
        
    }
    


//Function to load file

func decodeJSONFile() {
    
    //File URL using if let to prevent crashes
    if let fileLocation = Bundle.main.url(forResource: "TFLStations", withExtension: "json") {
        
        //Do try catch
        
        do {
            
            //Define Data
            let data = try Data(contentsOf: fileLocation)
            
            //Define Decoder
            let jsonDecode = JSONDecoder()
            
            //Decode the JSON Data
            let dataFromJSON = try jsonDecode.decode([Stations].self, from: data)
            
            
            //Allow for the data to load
            DispatchQueue.main.async {
                self.dataStructure = dataFromJSON
                
            }//Async
            
            
            
        } catch { //File Location
            
            print(error)
            
        }//Catch closure
        
        
    }//If let File search End
    
    
    
    }//Function decoder closure
    
  /*
    //Function to sort data
    func sortData() {
        
        //Sort Data Station lines
        self.dataStructure = self.dataStructure.sorted(by: {$0.lines == $1.lines})
        
        
    }
    */
    
    
    
}//Class Closure
