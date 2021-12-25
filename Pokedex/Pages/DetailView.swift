//
//  DetailView.swift
//  Pokedex
//
//  Created by Ram on 2021-12-21.
//

import SwiftUI
import StockCharts


struct DetailView: View {
    
    let user:Pokedex

    init (user:Pokedex) {
        self.user = user
    }
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading,spacing: 5) {
                AsyncImage(url: URL(string: user.imageurl)
                           ,content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 400, maxHeight: 250)
                },
                           placeholder: {
                    ProgressView()
                })
                Text(user.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                Text(user.xdescription)
                
                VStack(alignment: .leading) {
                    Text("Type")
                        .font(.title3)
                        .fontWeight(.semibold)
                    ForEach(0..<user.typeofpokemon.count) { i in
                        HStack
                        {
                            Circle()
                                .fill(checkColor(yourColor: user.typeofpokemon[i].rawValue))
                                .frame(width: 15, height: 15)
                        
                        Text(user.typeofpokemon[i].rawValue)
                        }
                    }
                }.padding()
                
                // Hit Points
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                        .overlay( VStack(alignment: .leading) {
                            Text("Weight")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.weight)
                        })
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                        .overlay( VStack(alignment: .leading) {
                            Text("Height")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.height)
                        })
                }
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 400, height: 120, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Hit Points - " + String(user.hp))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.hp))/100, style: CapsuleChartStyle(capsuleColor: Color.blue))
                                .padding(.top)
                        }
                            .padding()
                    )
                // Attack
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 400, height: 120, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Attack - " + String(user.attack))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.attack))/100, style: CapsuleChartStyle(capsuleColor: Color.red))
                                .padding(.top)
                        }
                            .padding()
                    )
                // Defence
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 400, height: 120, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Defence - " + String(user.defense))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.defense))/100, style: CapsuleChartStyle(capsuleColor: Color.green))
                                .padding(.top)
                        }
                            .padding()
                    )
                // Speed
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 400, height: 120, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Speed - "+String(user.speed))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.speed))/100, style: CapsuleChartStyle(capsuleColor: Color.mint))
                                .padding(.top)
                        }
                            .padding()
                    )
                
                // Special Attack
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 400, height: 120, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Special Attack - "+String(user.specialAttack))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.specialAttack))/100, style: CapsuleChartStyle(capsuleColor: Color.indigo))
                                .padding(.top)
                        }
                            .padding()
                    )
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 400, height: 240, alignment: .leading)
                .foregroundColor(.white)
                .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Weakness")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            ForEach(0..<user.weaknesses.count) { i in
                                HStack
                                {
                                    
                                    Circle()
                                        .fill(checkColor(yourColor: user.weaknesses[i].rawValue))
                                        .frame(width: 15, height: 15)
                                    Text(user.weaknesses[i].rawValue)
                                }
                            }
                        }.padding()
                    }
                )
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
    
    func checkColor(yourColor: String) -> Color {
        switch yourColor {
        case "Bug":
            return .brown
        case "Dark":
            return .gray
        case "Dragon":
            return .cyan
        case "Electric":
            return .yellow
        case "Fairy":
            return .pink
        case "Fighting":
            return .blue
        case "Fire":
            return .red
        case "Flying":
            return .green
        case "Ghost":
            return .black
        case "Grass":
            return .green
        case "Ground":
            return .brown
        case "Ice":
            return .gray
        case "Normal":
            return .mint
        case "Poison":
            return .teal
        case "Rock":
            return .indigo
        case "Steel":
            return .orange
        case "Water":
            return .blue
        default:
            return .pink
        }
    }
}
