//
//  HomeView.swift
//  GameStream
//
//  Created by elouis on 5/19/24.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    @State var selectedTab:Int = 2
    
    var body: some View {
        
        TabView (selection:$selectedTab){
            
            Text("Pantalla perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            Text("Pantalla juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Text("Pantalla Favorito")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
            
        }.accentColor(.white)
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
                
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando las vistas de home")
        
    }
}

struct HomeScreenView:View {
    
    @State var searchText:String = ""
    
    var body: some View{
        
        ZStack {
            
            Color("Marine")
            
            VStack {
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                    .padding(.bottom, 42.0)
                
                HStack{
                    
                    Button(action: searchVideo, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("DarkCyan") )
                    })
                    
                TextField(
                    text:$searchText,
                    label: {
                        Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }).foregroundColor(.white)
                    
                }
                    .padding([.top, .leading, .bottom], 11.0)
                    .background(Color("BlueGray"))
                    .clipShape(Capsule())
                
                SubHomeScreenView()
                
            }.padding(.horizontal, 18.0)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func searchVideo() {
        print("El usuario esta buscando un video...")
    }
}

struct SubHomeScreenView:View {
    @State var isVideoPlayerActive:Bool = true
    @State var url:String = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive:Bool = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
        
    var body: some View {
        
        VStack{
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isVideoPlayerActive = true
                }, label: {
                    VStack(spacing:0){
                        Image("theWitcher").resizable().scaledToFit()
                        
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("BlueGray"))
                    }
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        }
        
        NavigationLink(value: "videoPlayer"){
            EmptyView()
        }.navigationDestination(isPresented: $isVideoPlayerActive){
            VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 400, height: 400)
        }

    }
}
#Preview {
    HomeView()
}
