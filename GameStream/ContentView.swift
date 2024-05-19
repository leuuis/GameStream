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
                
                Text("Correo Electrónico").foregroundColor(Color("DarkCyan"))
                
                ZStack(alignment: .leading){
                    
                    if email.isEmpty{
                        
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    TextField("", text: $email).keyboardType(.emailAddress)
                    
                }
                
                Divider().frame(height: 1).background(Color("DarkCyan")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(Color("DarkCyan"))
                
                ZStack(alignment: .leading){
                    
                    if _password.isEmpty{
                        
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    SecureField("", text: $_password)
                    
                }
                
                Divider().frame(height: 1).background(Color("DarkCyan")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("DarkCyan"))
                    .padding(.bottom)
                
                Button(action: signIn, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(
                            top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("DarkCyan"), lineWidth: 1.0).shadow(color:.white, radius: 6))
                }).padding(.bottom)
                
                Text("Inicia sesión con redes sociales").frame( maxWidth: .infinity,  alignment: .center).foregroundColor(.white)
                
                HStack(){
                    
                    Button(action: {print ("Inicio de sesión con Facebook") }, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("BlueGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            .padding()
                    })
                    
                    Button(action: {print ("Inicio de sesión con Twitter") }, label: {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("BlueGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            .padding()
                    })

                    
                }
                
            }.padding(.horizontal, 77.0)
            
        }
        
    }
    
}

func signIn() {
    
    print("Estoy iniciando sesión...")
    
}

#Preview {
    ContentView()
}
