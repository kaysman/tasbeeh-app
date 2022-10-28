//
//  ContentView.swift
//  Tesbih
//
//  Created by MacBook Pro on 10/27/22.
//

import SwiftUI

extension View {
    func placeHolder<T:View>(_ holder: T, show: Bool) -> some View {
        self.modifier(PlaceHolder(placeHolder:holder, show: show))
    }
}

struct ContentView: View {
    @State private var showAlert : Bool = false
    @State private var count : Int = 0
    @State private var tasbeeh : String = "Subhanallah"
    
    let tasbeehs = ["Subhanallah", "Alhamdulillah", "Estagfirullah"]
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Button (
                        action: {
                            showAlert = true
                        },
                        label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .colorMultiply(.white)
                        }).padding()
                    Spacer()
                    Text("Tesbih")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    Button (
                        action: {
                            // change language
                        },
                        label: {
                            Image("flag")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
                    )
                }
                .padding()
                Spacer()
                Button (
                    action: {
                        count = count + 1;
                    },
                    label : {
                        Text("\(count)")
                            .frame(width: 250, height: 250, alignment: .center)
                            .font(.system(size: 68))
                            .padding()
                            .overlay(
                                Circle()
                                    .stroke(Color.orange, lineWidth: 4)
                            )
                    }
                )
                Section {
                    Text("Sanalýar:")
                        .padding(.top, 80)
                        .foregroundColor(.white)
                    Picker("", selection: $tasbeeh) {
                        ForEach(tasbeehs, id: \.self) {
                            Text("\($0)")
                        }
                    }.font(.headline)
                }
                    Spacer()
                    }
                    .alert("Bu bir tesbih programmasydyr. \n v1.0.0", isPresented: $showAlert) {
                        Button("Bolýa", role: .cancel) {}
                    }
            }
            .background(Image("fon"))
        }
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct PlaceHolder<T: View>: ViewModifier {
        var placeHolder: T
        var show: Bool
        func body(content: Content) -> some View {
            ZStack(alignment: .leading) {
                if show { placeHolder }
                content
            }
        }
    }


