//
//  HomeView.swift
//  GameStream
//
//  Created by elouis on 5/19/24.
//

import SwiftUI

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
    
    var body: some View{
        
        ZStack {
            
            Color("Marine")
            
            VStack {
                
                Text("hOME SCREEN").foregroundColor(.white)
                
            }.padding(.horizontal, 18.0)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
