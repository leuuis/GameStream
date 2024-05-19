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
                   
            Spacer()
            
            Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
            
            VStack(){
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                    .padding(.bottom, 42.0)
                
                SignInSignUpView()
            }
            
//            Image("pantalla1").resizable()
            
        }
    }
}

struct SignInSignUpView: View{
    
    @State var inSignInView:Bool = true
    
    var body: some View {
        
        VStack(){
            
            HStack {
                
                Spacer()
                
                Button("INICIA SESIÓN") {
                    
                    inSignInView = true
                    
                    print("Pantalla inicio de sesion")
                }
                .foregroundColor(inSignInView ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    
                    inSignInView = false
                    
                    print("Pantalla de registro")
                    
                }
                .foregroundColor(inSignInView ? .gray : .white)
                
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if inSignInView == true {
                
                SignInView()
                
            }else{
                
                SignUpView()
                
            }
            
        }
        
    }
    
}

struct SignUpView: View {
    
    var body: some View {
        
        Text("Pantalla registro")
        
    }
    
}

struct SignInView: View {
    
    @State var email:String = ""
    @State var _password:String = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading){
                
                Text("Correo Electrónico").foregroundColor(Color("darkCyan"))
                
                ZStack(alignment: .leading){
                    
                    if email.isEmpty{
                        
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    TextField("", text: $email)
                    
                }
                
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(Color("darkCyan"))
                
                ZStack(alignment: .leading){
                    
                    if _password.isEmpty{
                        
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    SecureField("", text: $_password)
                    
                }
                
                Divider().frame(height: 1).background(Color("darkCyan")).padding(.bottom)
                
                
            }.padding(.horizontal, 77.0)
            
        }
        
    }
    
}


#Preview {
    ContentView()
}
