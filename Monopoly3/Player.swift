//
//  Player.swift
//  Monopoly1
//
//  Created by Stefano Casafranca Laos on 11/20/24.
//

import Foundation

enum Token {
    case TopHat, Cat, Scotty, Thimble, Iron, Battleship, Car, Shoe
}

enum KindOfBuiling: Int{
    case Unimproved = 0 ,House1, house2, house3, house4, Hotel
}
class OwnedProperty {
    var nameOfProperty: Order
    var group: Group
    var mortgaged: Bool
    var building: KindOfBuiling
    
    init(nameOfProperty: Order, group: Group, mortgaged: Bool, building: KindOfBuiling) {
        self.nameOfProperty = nameOfProperty
        self.group = group
        self.mortgaged = mortgaged
        self.building = building
    }
}

class Player {
    var name: String
    var token: Token
    var inJail = false
    var getOutOfJailCards = 0
    var ownedProperties: [OwnedProperty] = []
    var money = 1500
    
    init(name: String, token: Token, inJail: Bool = false, getOutOfJailCards: Int = 0, money: Int = 1500) {
        self.name = name
        self.token = token
        self.inJail = inJail
        self.getOutOfJailCards = getOutOfJailCards
        self.money = money
    }
}
