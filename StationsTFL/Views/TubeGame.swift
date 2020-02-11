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
    
    
    
    
    
    //Function return random station name
    func stationName() -> String {
        
        let randomStationName = allStations.dataStructure.randomElement()
        
        return randomStationName?.name ?? ""
        
        
    }
    
    
    
    
    
    var body: some View {
        
        

        VStack {
            
            Spacer().frame(height:10)
            
            HStack {
            Button(action: {
                
                self.tubeSation = self.stationName()
                
                
                
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
            

            VStack {
                
                Section(header: Text("Select Line(s) for Station").bold()) {
                
                        HStack {//Row 1
                            
                            
                            //District Line
                            GameButton(icon: districtLineButtonToggle, lineImage: rowOneDistrictLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.districtLineButtonToggle.toggle()
                                    
                                    })
                            
                            
                            
                            //Piccadilly line
                            GameButton(icon: piccadillyLineButtonToggle, lineImage: rowOnePiccadillyLine, blankImage: backOfImage)
                                
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.piccadillyLineButtonToggle.toggle()
                            })
                            
                            //Circle Line
                            GameButton(icon: circleLineButtonToggle, lineImage: rowOneCirclLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    
                                    self.circleLineButtonToggle.toggle()
                                    
                                    
                                })
                            
                            
                            //Bakerloo Line
                            GameButton(icon: bakerlooLineButtonToggle, lineImage: rowOneBakerlooLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.bakerlooLineButtonToggle.toggle()
                                    
                                    
                                })
                             
                    
                            
                        }//End of HStack
                        
                        
                        HStack {//Row 2
                            
                            //Jubilee Line
                            GameButton(icon: jubileeLineButtonToggle, lineImage: rowTwoJubileeLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.jubileeLineButtonToggle.toggle()
                                    
                                    
                                })
                            
                            //Metropolitan Line
                            GameButton(icon: metropolitanLineButtonToggle, lineImage: rowTwoMetropolitanLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.metropolitanLineButtonToggle.toggle()
                                    
                                    
                                })
                            
                            
                            //Central Line
                            GameButton(icon: centralLineButtonToggle, lineImage: rowTwoCentralLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.centralLineButtonToggle.toggle()
                                    
                                })
                            
                            //Victoria Line
                            GameButton(icon: victoriaLineButtonToggle, lineImage: rowTwoVictoriaLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.victoriaLineButtonToggle.toggle()
                                    
                                })
                            
                            
                            
                        }//End of HStack Row 2
                        
                        
                        HStack {//Row 3
                            
                            //Northern Line
                            GameButton(icon: northernLineButtonToggle, lineImage: rowThreeNorthernLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.northernLineButtonToggle.toggle()
                                    
                                })
                            
                            
                            //Waterloo Line
                            GameButton(icon: waterlooLineButtonToggle, lineImage: rowThreeWaterlooLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.waterlooLineButtonToggle.toggle()
                                })
                            
                            //Hammersmith Line
                            GameButton(icon: hammersmithLineButtonToggle, lineImage: rowThreeHammersmithLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.hammersmithLineButtonToggle.toggle()
                                })
                            
                            //Docklands Light
                            GameButton(icon: docklandsLineButtonToggle, lineImage: rowThreeDocklandsLine, blankImage: backOfImage)
                            
                                .gesture(TapGesture().onEnded() {
                                    
                                    self.docklandsLineButtonToggle.toggle()
                                })
                            
                            
                        }//HStack Row 3 Ends
                    
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
                    Spacer()
                
                }
                
                .navigationBarTitle(Text("Tube Game"),displayMode: .inline)
                
            }//Vstack Ending
        }
    }
    
    
    
    
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



