//
//  TubeGame.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 10/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Game - Know your tube station
import SwiftUI


struct TubeGame: View {
    
    

    
    var body: some View {
        
        
        //Call Station display game
        StationDisplay()

    
    
}



//Preview
struct TubeGame_Previews: PreviewProvider {
    
    static var previews: some View {
        TubeGame()
        
    }
}

//Game Buttons
struct GameButton: View {
    
    var icon : Bool
    var lineImage = ""
    var blankImage = ""
    
    
    
    var body: some View {
        

        
        Image(icon ? lineImage : blankImage)
            .resizable()
            .frame(width: 80, height: 80, alignment: .center)
            .border(Color.white, width: 1.0)
        
        //Set Animation
            .rotation3DEffect(self.icon ? Angle(degrees: 360): Angle(degrees: 180), axis: (x:CGFloat(0), y:CGFloat(10), z:CGFloat(0)))
            .animation(.default)
        
        
        
    }
}



struct StationDisplay:  View {
    
    //Data from JSON File
      @ObservedObject var allStations = DataLoader()
      
      //Icons - Row One
      var rowOneDistrictLine = "District_Icon"
      var rowOnePiccadillyLine = "Piccadilly_Icon"
      var rowOneCirclLine = "Circle_Icon"
      var rowOneBakerlooLine = "Bakerloo_Icon"
      
      //Icons - Row Two
      var rowTwoJubileeLine = "Jubilee_Icon"
      var rowTwoMetropolitanLine = "Metropolitan_Icon"
      var rowTwoCentralLine = "Central_Icon"
      var rowTwoVictoriaLine = "Victoria_Icon"
      
     //Icon - Row Three
      var rowThreeNorthernLine = "Northern_Icon"
      var rowThreeWaterlooLine = "Waterloo_Icon"
      var rowThreeHammersmithLine = "Hammersmith_Icon"
      var rowThreeDocklandsLine = "Docklands_Icon"
      
      //Icon - Blank Image
      var backOfImage = "Station_Icon"
      
      @State private var tubeSation = ""
      
      //Toggle for Buttons
      @State private var backOfButtonToggle = false
      
      //Line Buttons - Row One Toggle
      @State private var districtLineButtonToggle = true
      @State private var piccadillyLineButtonToggle = true
      @State private var circleLineButtonToggle = true
      @State private var bakerlooLineButtonToggle = true
      
      //Line Buttons - Row Two Toggle
      @State private var jubileeLineButtonToggle = true
      @State private var metropolitanLineButtonToggle = true
      @State private var centralLineButtonToggle = true
      @State private var victoriaLineButtonToggle = true
      
      
      //Line Button - Row Three Toggle
      @State private var northernLineButtonToggle = true
      @State private var waterlooLineButtonToggle = true
      @State private var hammersmithLineButtonToggle = true
      @State private var docklandsLineButtonToggle = true
      
      //Selected Lines - Row One
      @State private var districtLineSelected = ""
      @State private var piccadillyLineSelected = ""
      @State private var circleLineSelected = ""
      @State private var bakerlooLineSelected = ""
      
      //Selected Lines - Row Two
      @State private var jubileeLineSelected = ""
      @State private var metropolitanLineSelected = ""
      @State private var centralLineSelected = ""
      @State private var victoriaLineSelected = ""
    
       //Selected Lines - Row Three
       @State private var northernLineSelected = ""
       @State private var waterlooLineSelected = ""
       @State private var hammersmithLineSelected = ""
       @State private var docklandsLineSelected = ""
        
       @State private var clueNumberOfStations = ""
      
      
      
      
      //Function return random station name
      func stationName() -> String {
          
          let randomStationName = allStations.dataStructure.randomElement()
          
          return randomStationName?.name ?? ""
          
          
      }
    
    //function to count the number of stations
    func stationClue(inStation: String) -> Int {
        
     
        
        let stationLineFilter = allStations.dataStructure.filter {$0.name == inStation}
        let totalCount = stationLineFilter.reduce(0) {$0 + $1.lines.count}
       
        return totalCount
    }
      
    
    var body: some View {
        
    
        
        VStack {
            
            
            
                VStack {
                    
                    Spacer().frame(height:10)
                    
                    HStack {
                    Button(action: {
                        
                        self.tubeSation = self.stationName()
                        self.clueNumberOfStations = self.tubeSation
                        readSelectedLines(line: self.tubeSation)
                        
                        
                        
                    }) {
                        
                        
                       Text("Get Station")
                        .padding()
                        .frame(width:120,height: 40)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                        
                    }.padding()
                    
                    TextField("Station Name",text: $tubeSation)
                    
                    }
                    
                    Spacer().frame(height: 50)
                    

                   
                
              
            
                
            }
                       
                       Section(header: Text("Select Line(s) for Station").bold()) {
                       
                               HStack {//Row 1
                                   
                                   
                                   //District Line
                                   GameButton(icon: districtLineButtonToggle, lineImage: rowOneDistrictLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                          self.districtLineButtonToggle.toggle()
                                          
                                           if self.districtLineButtonToggle {
                                               
                                               self.districtLineSelected = ""
                                        
                                               
                                               
                                           } else {
                                               
                                               self.districtLineSelected = "District"
                                               
                                               //Play selected
                                                readSelectedLines(line: self.districtLineSelected)
                                            
                                               
                                           }
                                           
                                           
                                           })
                                       
                                   
                                   
                                   
                                   //Piccadilly line
                                   GameButton(icon: piccadillyLineButtonToggle, lineImage: rowOnePiccadillyLine, blankImage: backOfImage)
                                       
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.piccadillyLineButtonToggle.toggle()
                                           
                                           if self.piccadillyLineButtonToggle {
                                               
                                               self.piccadillyLineSelected = ""
                                           } else {
                                               
                                               self.piccadillyLineSelected = "Picadilly"
                                                //Play Selected
                                            readSelectedLines(line: self.piccadillyLineSelected)
                                           }
                                   })
                                   
                                   //Circle Line
                                   GameButton(icon: circleLineButtonToggle, lineImage: rowOneCirclLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           
                                           self.circleLineButtonToggle.toggle()
                                           
                                           if self.circleLineButtonToggle {
                                               
                                               self.circleLineSelected = ""
                                           } else {
                                               
                                               self.circleLineSelected = "Circle"
                                            
                                                //Play Selected
                                                readSelectedLines(line: self.circleLineSelected)
                                           }
                                           
                                           
                                       })
                                   
                                   
                                   //Bakerloo Line
                                   GameButton(icon: bakerlooLineButtonToggle, lineImage: rowOneBakerlooLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.bakerlooLineButtonToggle.toggle()
                                           
                                           if self.bakerlooLineButtonToggle {
                                               
                                               self.bakerlooLineSelected = ""
                                           } else {
                                               
                                               self.bakerlooLineSelected = "Bakerloo"
                                                //Play Selected
                                                readSelectedLines(line: self.bakerlooLineSelected)
                                           }
                                           
                                           
                                       })
                                    
                           
                                   
                               }//End of HStack
                               
                               
                               HStack {//Row 2
                                   
                                   //Jubilee Line
                                   GameButton(icon: jubileeLineButtonToggle, lineImage: rowTwoJubileeLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.jubileeLineButtonToggle.toggle()
                                           
                                           if self.jubileeLineButtonToggle {
                                               
                                               self.jubileeLineSelected = ""
                                           } else {
                                               
                                               self.jubileeLineSelected = "Jubilee"
                                            //Play Selected
                                            readSelectedLines(line: self.jubileeLineSelected)
                                           }
                                           
                                           
                                       })
                                   
                                   //Metropolitan Line
                                   GameButton(icon: metropolitanLineButtonToggle, lineImage: rowTwoMetropolitanLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.metropolitanLineButtonToggle.toggle()
                                           
                                           if self.metropolitanLineButtonToggle {
                                               
                                               self.metropolitanLineSelected = ""
                                           } else {
                                               
                                               self.metropolitanLineSelected = "Metropolitan"
                                            
                                                //Play Selected
                                                readSelectedLines(line: self.metropolitanLineSelected)
                                           }
                                           
                                           
                                       })
                                   
                                   
                                   //Central Line
                                   GameButton(icon: centralLineButtonToggle, lineImage: rowTwoCentralLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.centralLineButtonToggle.toggle()
                                           
                                           if self.centralLineButtonToggle {
                                               
                                               self.centralLineSelected = ""
                                           } else {
                                               
                                               self.centralLineSelected = "Central"
                                            //Play Selected
                                            readSelectedLines(line: self.centralLineSelected)
                                           }
                                           
                                       })
                                   
                                   //Victoria Line
                                   GameButton(icon: victoriaLineButtonToggle, lineImage: rowTwoVictoriaLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.victoriaLineButtonToggle.toggle()
                                           
                                           if self.victoriaLineButtonToggle {
                                               
                                               self.victoriaLineSelected = ""
                                           } else {
                                               
                                               self.victoriaLineSelected = "Victoria"
                                                //Play Selected
                                                readSelectedLines(line: self.victoriaLineSelected)
                                           }
                                           
                                       })
                                   
                                   
                                   
                               }//End of HStack Row 2
                               
                               
                               HStack {//Row 3
                                   
                                   //Northern Line
                                   GameButton(icon: northernLineButtonToggle, lineImage: rowThreeNorthernLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.northernLineButtonToggle.toggle()
                                        
                                        if self.northernLineButtonToggle {
                                            
                                            self.northernLineSelected = ""
                                        } else {
                                            
                                            self.northernLineSelected = "Northern"
                                            //Play Selected
                                            readSelectedLines(line: self.northernLineSelected)
                                        }
                                           
                                       })
                                   
                                   
                                   //Waterloo Line
                                   GameButton(icon: waterlooLineButtonToggle, lineImage: rowThreeWaterlooLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.waterlooLineButtonToggle.toggle()
                                        
                                        if self.waterlooLineButtonToggle {
                                            
                                            self.waterlooLineSelected = ""
                                            
                                        } else {
                                            
                                            self.waterlooLineSelected = "Waterloo"
                                            //Play Selected
                                            readSelectedLines(line: self.waterlooLineSelected)
                                        }
                                       })
                                   
                                   //Hammersmith Line
                                   GameButton(icon: hammersmithLineButtonToggle, lineImage: rowThreeHammersmithLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.hammersmithLineButtonToggle.toggle()
                                        
                                        if self.hammersmithLineButtonToggle {
                                            
                                            self.hammersmithLineSelected = ""
                                            
                                        } else {
                                            
                                            self.hammersmithLineSelected = "Hammersmith"
                                            //Play Selected
                                            readSelectedLines(line: self.hammersmithLineSelected)
                                        }
                                        
                                       })
                                   
                                   //Docklands Light
                                   GameButton(icon: docklandsLineButtonToggle, lineImage: rowThreeDocklandsLine, blankImage: backOfImage)
                                   
                                       .gesture(TapGesture().onEnded() {
                                           
                                           self.docklandsLineButtonToggle.toggle()
                                        
                                        if self.docklandsLineButtonToggle {
                                            
                                            self.docklandsLineSelected = ""
                                            
                                        } else {
                                            self.docklandsLineSelected = "Docklands"
                                            //Play Selected
                                            readSelectedLines(line: self.docklandsLineSelected)
                                            
                                        }
                                       })
                                   
                                   
                               }//HStack Row 3 Ends
                           
                           
                           //List selected Lines
                           Section(header: Text("Lines Selected").bold()) {
                               
                               HStack {
                               
                               Text("\(self.districtLineSelected)")
                                   .foregroundColor(Color.green)
                               
                               Text("\(self.piccadillyLineSelected)")
                                   .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.9))
                               
                               Text("\(self.circleLineSelected)")
                                   .foregroundColor(Color.yellow)
                               
                               Text("\(self.bakerlooLineSelected)")
                                   .foregroundColor(Color(red: 0.6, green: 0.4, blue: 0.2))
                                
                           
                               }//End of Row one
                               
                               
                               HStack {//Row Two
                                   
                                   Text("\(self.jubileeLineSelected)")
                                       .foregroundColor(Color.gray)
                                   
                                   Text("\(self.metropolitanLineSelected)")
                                       .foregroundColor(Color.purple)
                                   
                                   Text("\(self.centralLineSelected)")
                                       .foregroundColor(Color.red)
                                   
                                   Text("\(self.victoriaLineSelected)")
                                       .foregroundColor(Color.blue)
                                
                                }//End of Row Two
                            
                            
                            HStack {//Row Three
                                
                                Text("\(self.northernLineSelected)") //Leave color as default due to dark mode compatibility
                                
                                Text("\(self.waterlooLineSelected)")
                                    .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.3))
                                   
                                
                                Text("\(self.hammersmithLineSelected)")
                                    .foregroundColor(Color(red: 0.9, green: 0.0, blue: 0.6))
                                
                                Text("\(self.docklandsLineSelected)")
                                    .foregroundColor(Color(red: 0.1, green: 0.9, blue: 0.9))
                                
                                
                                
                            }
                            
                            HStack {//Test Ground
                                
                                Text("Clue!!! : \(stationClue(inStation: self.clueNumberOfStations)) Stations").bold()
                                    .foregroundColor(Color.green)
                                
                                
                            }
                            
                           }
                           
                           Spacer().frame(height:80)
                           
                           HStack {
                                   
                               Button(action: {
                                   
                                   
                               }) {
                                   
                                   Text("calculate")
                                       .padding()
                                       .frame(width:120,height: 40)
                                       .background(Color.blue)
                                       .foregroundColor(Color.white)
                                       .cornerRadius(6)
                                   
                                   
                                   
                                   
                               }
                               
                               
                                   Text("Score:")
                                       .foregroundColor(Color.purple)
                                       .font(.system(size: 25))
                                       .padding()
                                       
                           
                           
                           }.padding().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                           //Spacer()
                           
                           
                       
                       }
                           
                  
                           
                     
                       .navigationBarTitle(Text("Tube Game"),displayMode: .inline)
                       
                   }//Vstack Ending
               }
        
        
        
        
        
    }
    
}



