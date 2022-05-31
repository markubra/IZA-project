//
//  FavoriteLocationsView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 26.05.2022.
//

import SwiftUI

struct FavoriteLocationsListView: View {
    @StateObject var favoriteLocationsVM = CoreDataManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 8, opaque: true)

                List {
                    ForEach($favoriteLocationsVM.savedEntites) { $location in
                        NavigationLink (destination: FavoriteLocationView(location: $location)) {
                            Text(location.name ?? "NO NAME")
                                .font(.system(size: 20))
                                .frame(height: 50)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: favoriteLocationsVM.deleteLocation)
                }
                .listStyle(.plain)
                .navigationTitle("Favorite Locations")
                .navigationBarItems(leading: EditButton(), trailing: AddLocationButtonView(favoriteLocations: favoriteLocationsVM))
                .onAppear {
                    UINavigationBarAppearance()
                        .setColor(title: .white, background: UIColor.clear)
                }
            }
        }
        .foregroundColor(Color.white)
        .accentColor(Color(.white))
    }
}

struct FavoriteLocationView: View {
    var weatherManager = WeatherManager()
    @State var response: ResponseBody?
    @Binding var location: LocationEntity
    @State var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            if let response = response {
                WeatherView(weather: Weather(responseModel: response))
            } else {
                LoadingView()
                    .task {
                        do {
                            if let locationName = location.name {
                                response = try await weatherManager.getCurrentWeather(requestType: .cityName(city: locationName))
                            } else {
                                print("Error getting name from CoreData")
                            }
                        } catch {
                            showAlert.toggle()
                            print("Error getting weather: \(error)")
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("The weather cannot be found for the specified location or your internet connection is not working."), dismissButton: .default(Text("Try Again"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }))
                    }
            }
        }
    }
}

struct AddLocationButtonView: View {
    @ObservedObject var favoriteLocations: CoreDataManager
    @State private var showAlert: Bool = false
    
    var body: some View {
        Button(action: {
            alertTF(title: "Add Location", message: "Please enter the name of location.", hintText: "Los Angeles", primaryTitle: "Add", secondaryTitle: "Cancel") { locationName in
                checkLocationName(locationName: locationName)
            } secondaryAction: { }
        }, label: {
            HStack {
                Text("Add Location")
                Image(systemName: "plus.circle")
            }
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Missing Location Name"), message: Text("You need to specify the location name."), dismissButton: .default(Text("OK")))
        }
    }
    
    func checkLocationName(locationName: String) {
        if locationName.isEmpty {
            showAlert.toggle()
        } else {
            favoriteLocations.addLocation(text: locationName)
        }
    }
}
