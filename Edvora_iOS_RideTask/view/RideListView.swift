//
//  ErrorView.swift
//  ErrorView
//
//  Created by Eman Elrefai on 25/02/2022.
//

import SwiftUI

struct RideListView: View {
    let rides: [Ride]
    let users: [User]
    
    var body: some View {
        VStack{
            HStack {
                Text("Edvora")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                ForEach(users) { user in
                    
                    if user.url != nil {
                        AsyncImage(url: URL(string: user.url!)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            } else if phase.error != nil {
                                
                                Text(phase.error?.localizedDescription ?? "error")
                                    .foregroundColor(Color.pink)
                                    .frame(width: 20, height: 20)
                            } else {
                                Image("profileImageIcon").padding(.trailing, 16)
                                    .frame(width: 20, height: 20)
                            }
                            
                        }
                    }else {
                        Color.gray.frame(width: 20, height: 20)
                    }
                    
                }
                Image("profileImageIcon").padding(.trailing, 16)
                
            }
            HStack{
                Button(action: {
                    Text("Nearest").padding().foregroundColor(.black).font(.system(size: 25))
                    Image("lineIcon")
                }){
                    Text("Nearest").foregroundColor(.gray)
                    
                }
                Spacer()
                Button(action: {
                    print("action triggered")
                }){
                    Text("Past(2)").foregroundColor(.gray)
                    
                }
                Spacer()
                Button(action: {
                    print("action triggered")
                }){
                    Text("Upcoming(4)").foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    print("action triggered")
                }){
                    Label("Filter", image: "filterIcon").padding().foregroundColor(.black)
                    
                }.contextMenu {
                    cardContextMenu
                }
                
                
                
            }.padding(.leading,16)
            
            
            NavigationView {
                List{
                    ForEach(rides) { ride in
                        NavigationLink {
                            GeometryReader{_ in
                                
                                Menu(ride: ride)
                            }.background(
                                
                                Color.black.opacity(0.65)
                                    .edgesIgnoringSafeArea(.all)
                            )
                        } label: {
                            RideRow(ride: ride)
                        }
                        
                    }
                }.padding(.top,-200)
            }
            .listStyle(PlainListStyle())
        }
    }
    
    var cardContextMenu: some View {
        Section {
            
            Button(action: {}) {
                Label("Filters", image: "")
            }
            
            Button(action: {}) {
                Label("City", image: "arrowDown")
            }
            
            Button(action: {}) {
                Label("State", image: "arrowDown")
            }
        }
        
        
    }
}


struct RideListView_Previews: PreviewProvider {
    static var previews: some View {
        RideListView(rides: RideFetcher.successState().rides, users: UserFetcher.successState().users )
    }
}
