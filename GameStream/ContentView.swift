//
//  ContentView.swift
//  GameStream
//
//  Created by elouis on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
                        
            Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
            
            VStack(){
                
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                
                InicioRegistroView()
            }
            
//            Image("pantalla1").resizable()
            
        }
    }
}

struct InicioRegistroView: View{
    
    var body: some View {
            
        VStack(){
            
            HStack {
                Text("INICIA SESION")
                Text("REGÍSTRATE")
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
