//
//  onBoadingScreen.swift
//  onBoadingScreen
//
//  Created by nyannyan0328 on 2021/08/28.
//

import SwiftUI

struct onBoadingScreen: View {
    @State var offset : CGFloat = 0
    var body: some View {
        offsetPageTabView(offset: $offset) {
            
            HStack(spacing:0){
                
                ForEach(boadingScreens){screen in
                    
                    VStack(spacing:15){
                        
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                            .scaleEffect(getScreenBounds().height < 750 ? 0.9 : 1)
                            .offset(y: getScreenBounds().height < 750 ? -100 : -110)
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(screen.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .padding(.top,20)
                            
                            Text(screen.description)
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        .offset(y: -70)
                        
                        
                    }
                    .padding()
                    .frame(width: getScreenBounds().width)
                    .frame( maxHeight: .infinity)
                    
                    
                }
                
            }
            
            
        }
        .background(
            
            
            RoundedRectangle(cornerRadius: 50)
                .fill(.white)
                .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 25))
                .rotationEffect(.init(degrees : getRotation()))
                
                .offset(y: -getScreenBounds().width + 20)
            
            
            ,alignment: .leading
            
            
            
            
            
        )
        .background(Color("screen\(Int(getIndex() + 1))")
        
                        .animation(.easeInOut, value: getIndex())
        
        
        )
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
            
            VStack{
                
                HStack(spacing:20){
                    
                    Button {
                        
                    } label: {
                        
                        Text("Login With MLB")
                            .font(.caption.bold())
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,20)
                            .background(.white,in:RoundedRectangle(cornerRadius: 20))
                        
                    }
                    
                    Button {
                        
                    } label: {
                        
                        Text("Login With MLB")
                            .font(.caption.bold())
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,20)
                            .background(.white,in:RoundedRectangle(cornerRadius: 20))
                            .offset(x: -5)
                        
                    }
                    
                    
                    
                }
                
                HStack{
                    
                    
                    Button {
                        
                    } label: {
                        
                        Text("**Skip**")
                            .foregroundColor(.black)
                    }
                    
                    
                    HStack(spacing:8){
                        
                        ForEach(boadingScreens.indices,id:\.self){index in
                            
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 8, height: 8)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .scaleEffect(index == getIndex() ? 1.5 : 1)
                                .animation(.easeInOut, value: getIndex())
                            
                            
                            
                            
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    
                    
                    Button {
                        
                        
                        offset = min(offset + getScreenBounds().width,getScreenBounds().width * 3)
                        
                    } label: {
                        
                        Text("**Next**")
                            .foregroundColor(.black)
                    }
                    
                    
                    
                    
                    
                }
                .padding(.top,20)
                .padding(.horizontal)
                
                
            }
            
            
            
            
                .padding()
            
            ,alignment:.bottom
            
        )
        
        
    }
    
    func getRotation()->Double{
        
        
        let progreess = offset / (getScreenBounds().width * 4)
        
        let rotation = Double(progreess) * 360
        return rotation
        
    }
    
    func getIndex()->Int{
        
        
        let progress = ( offset / getScreenBounds().width).rounded()
        
        return Int(progress)
        
        
    }
}

struct onBoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        onBoadingScreen()
    }
}

extension View{
    
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
}
