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
                            Text("Hit Points")
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
                            Text("Attack")
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
                            Text("Defence")
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
                            Text("Speed")
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
                            Text("Special Attack")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.specialAttack))/100, style: CapsuleChartStyle(capsuleColor: Color.indigo))
                                .padding(.top)
                        }
                            .padding()
                    )
                
                // Special Defence
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 400, height: 120, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Special Attack")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            CapsuleChartView(percentageOfWidth: CGFloat(Float(user.specialDefense))/100, style: CapsuleChartStyle(capsuleColor: Color.cyan))
                                .padding(.top)
                        }
                            .padding()
                    )
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 400, height: 120, alignment: .center)
                .foregroundColor(.white)
                .shadow(color: Color(.gray).opacity(0.15), radius: 10)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Weakness")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            ForEach(0..<user.weaknesses.count) { i in
                                Text(user.weaknesses[i].rawValue)
                            }
                        }.padding()
                        
                        
                        VStack(alignment: .leading) {
                            Text("Pokemon Type")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            ForEach(0..<user.weaknesses.count) { i in
                                Text(user.weaknesses[i].rawValue)
                            }
                        }.padding()
                    }
                )
        }
    }
}
