//
//  Pokedex.swift
//  Pokedex
//
//  Created by Ram on 2021-12-20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Pokedex: Codable,Identifiable,Hashable {
    let name, id: String
    let imageurl: String
    let xdescription, ydescription, height, category: String
    let weight: String
    let typeofpokemon, weaknesses: [Typeofpokemon]
    let evolutions, abilities: [String]
    let hp, attack, defense, specialAttack: Int
    let specialDefense, speed, total: Int
    let malePercentage, femalePercentage: MalePercentage?
    let genderless: Int
    let cycles: Cycles
    let eggGroups, evolvedfrom, reason, baseExp: String

    enum CodingKeys: String, CodingKey {
        case name, id, imageurl, xdescription, ydescription, height, category, weight, typeofpokemon, weaknesses, evolutions, abilities, hp, attack, defense
        case specialAttack = "special_attack"
        case specialDefense = "special_defense"
        case speed, total
        case malePercentage = "male_percentage"
        case femalePercentage = "female_percentage"
        case genderless, cycles
        case eggGroups = "egg_groups"
        case evolvedfrom, reason
        case baseExp = "base_exp"
    }
}

enum Cycles: String, Codable {
    case empty = "-"
    case the10 = "10 "
    case the120 = "120 "
    case the15 = "15 "
    case the19 = "19 "
    case the20 = "20 "
    case the25 = "25 "
    case the30 = "30 "
    case the35 = "35 "
    case the40 = "40 "
    case the5 = "5 "
    case the80 = "80 "
}

enum MalePercentage: String, Codable {
    case the0 = "0%"
    case the100 = "100%"
    case the125 = "12.5%"
    case the25 = "25%"
    case the50 = "50%"
    case the75 = "75%"
    case the875 = "87.5%"
}

enum Typeofpokemon: String, Codable {
    case bug = "Bug"
    case dark = "Dark"
    case dragon = "Dragon"
    case electric = "Electric"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case flying = "Flying"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case none = "None"
    case normal = "Normal"
    case poison = "Poison"
    case psychic = "Psychic"
    case rock = "Rock"
    case steel = "Steel"
    case water = "Water"
}

typealias pokedex = [Pokedex]
