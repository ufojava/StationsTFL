//
//  MapController.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 09/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//File to represent Maps
import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    //Observed variabled
 
    @EnvironmentObject var mapCoordinates: CoordinateLongLat
    

     
    
        //Function to make mapview
        func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
            
            MKMapView(frame: .zero)
            
            
            }//End makeUIView
    
    
    //Fucntion to update MapView
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        
        //Station Location
        let location = CLLocationCoordinate2D(latitude: mapCoordinates.latitude, longitude: mapCoordinates.longitude)
     
        
        //Span
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        //Region
        let region = MKCoordinateRegion(center: location, span: span)
        
        uiView.setRegion(region, animated: true)
        
        
        //Annotate
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = mapCoordinates.name
        annotation.subtitle = "Tube Station"
        uiView.addAnnotation(annotation)
        
    }
    
}




struct MapView_Previews: PreviewProvider {

    static var previews: some View {
        
        MapView()
}

}
