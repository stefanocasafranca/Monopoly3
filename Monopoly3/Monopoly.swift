//
//  Monopoly.swift
//  Monopoly1
//
//  Created by Stefano Casafranca Laos on 11/12/24.
//

import Foundation

//
//  Game.swift
//  ITSE-1370-Monopoly
//
//  Created by Russell Collins on 6/16/21.
//  Modified by Russell Collins on 6/18/2021.
//  Adapted code for enum using Python source
//

enum Order: Int, CaseIterable, Equatable {
    case Go = 0
    case MediterraneanAve
    case CommunityChest1
    case BalticAve
    case IncomeTax
    case ReadingRR
    case OrientalAve
    case Chance1
    case VermontAve
    case ConnecticuttAve
    case Jail
    case StCharlesPlace
    case ElectricCo
    case StateAve
    case VirginiaAve
    case PennsylvaniaRR
    case StJamesPlace
    case CommunityChest2
    case TennesseeAve
    case NewYorkAve
    case FreeParking
    case KentuckyAve
    case Chance2
    case IndianaAve
    case IllinoisAve
    case BandORR
    case AtlanticAve
    case VentnorAve
    case WaterWorks
    case MarvinGardens
    case GoToJail
    case PacificAve
    case NorthCarolinaAve
    case CommunityChest3
    case PennsylvaniaAve
    case ShortLineRR
    case Chance3
    case ParkPlace
    case LuxuryTax
    case Boardwalk
    case Unplaced
}

enum Group: String {
    case Safe
    case Movement
    case CommunityChest
    case Chance
    case Tax
    case LuxuryTax
    case Jail
    case Railroad
    case Utility
    case DarkPurple
    case LightBlue
    case Purple
    case Orange
    case Red
    case Yellow
    case Green
    case Blue
}

struct Square: CustomStringConvertible {
    var order: Order
    var group: Group
    var price: Int
    var rents: [Int]
    
    var hotelRent: Int {
        return rents[5]
    }
    var improvements: Int {
        switch group {
        case .DarkPurple, .LightBlue:
            return 50
        case .Purple, .Orange:
            return 100
        case .Red, .Yellow:
            return 150
        case .Green, .Blue:
            return 200
        default:
            return 0
        }
    }
    var mortgage: Int {
        return price / 2
    }
    
    var name: String {
        let names: [String] = [
            "Go", "Mediterranean Ave.", "Community Chest", "Baltic Ave.", "Income Tax",
            "Reading Railroad", "Oriental Ave.", "Chance", "Vermont Ave.", "Connecticutt Ave.",
            "Just Visiting/Jail", "St. Charles Place", "Electric Company", "State Ave.", "Virginia Ave.",
            "Pennsylvania Railroad", "St. James Place", "Community Chest", "Tennessee Ave.", "New York Ave.",
            "Free Parking", "Kentucky Ave.", "Chance", "Indiana Ave.", "Illinois Ave.",
            "B & O Railroad", "Atlantic Ave.", "Ventnor Ave.", "Water Works", "Marvin Gardens",
            "Go to Jail", "Pacific Ave.", "North Carolina Ave.", "Community Chest", "Pennsylvania Ave.",
            "Short Line Railroad", "Chance", "Park Place", "Luxury Tax", "Boardwalk" ]
        return names[order.rawValue]
    }
    
    var description: String {
        switch group {
        case .Movement, .Safe, .CommunityChest, .Chance, .LuxuryTax, .Jail, .Tax:
            return "\(order.rawValue): \(name)"
        case .DarkPurple, .LightBlue, .Purple, .Orange,
             .Red, .Yellow, .Green, .Blue:
            return "\(order.rawValue): \(name) [\(group.rawValue)] price: $\(price), basic: $\(rents[0]), 1 house: $\(rents[1]), 2 houses: $\(rents[2]), 3 houses: $\(rents[3]), 4 houses: $\(rents[4]), hotel: $\(rents[5]) mtg. $\(mortgage)"
        case .Railroad:
            return "\(order.rawValue): \(name) [\(group.rawValue)] price: $\(price), 1 RR: $\(rents[1]), 2 RRs: $\(rents[2]), 3 RRs: $\(rents[3]), 4 RRs: $\(rents[4]), mtg. $\(mortgage)"
        case .Utility:
            return "\(order.rawValue): \(name) [\(group.rawValue)] price: $\(price), 1 utility: $\(rents[1]) X dice roll, 2 utilities: $\(rents[2]) X dice roll, mtg. $\(mortgage)"
        }
    }
    
    init(order: Order, group: Group, price: Int, rents: [Int]) {
        self.order = order
        self.group = group
        self.price = price
        self.rents = rents
    }
    
    init(order: Order, group: Group) {
        self.order = order
        self.group = group
        self.price = 0
        self.rents = Array<Int>()
    }
    
    func rent(withMonopoly: Bool) -> Int {
        return withMonopoly ? 2 * rents[0] : rents[0]
    }
    
    func rent(forHouses: Int) -> Int {
        return rents[forHouses]
    }
    
    func rent(forHotel: Bool) -> Int {
        return forHotel ? rents[5] : rents[0]
    }
    
    func isProperty() -> Bool {
        switch self.group {
        case.Blue, .DarkPurple, .Green,.LightBlue,.Orange,.Red,.Yellow:
            return true
            
        default:
            return false
        }
    }
    
}

var theBoard: [Square] = [
    Square(order: .Go, group: .Safe),
    Square(order: .MediterraneanAve, group: .DarkPurple, price: 60, rents: [2, 10, 30, 90, 160, 250]),
    Square(order: .CommunityChest1, group: .CommunityChest),
    Square(order: .BalticAve, group: .DarkPurple, price: 60,        rents: [4, 20, 60, 180, 320, 45]),
    Square(order: .IncomeTax, group: .Tax),
    
    Square(order: .ReadingRR, group: .Railroad, price: 200,         rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .OrientalAve, group: .LightBlue, price: 100,      rents: [6, 30, 90, 270, 400, 550]),
    Square(order: .Chance1, group: .Chance),
    Square(order: .VermontAve, group: .LightBlue, price: 100,       rents: [6, 30, 90, 270, 400, 550]),
    Square(order: .ConnecticuttAve, group: .LightBlue, price: 120,  rents: [8, 40, 100, 300, 450, 600]),
    
    Square(order: .Jail, group: .Jail),
    Square(order: .StCharlesPlace, group: .Purple, price: 140,      rents: [10, 50, 150, 450, 625, 750]),
    Square(order: .ElectricCo, group: .Utility, price: 150,         rents: [0, 4, 11, 0, 0, 0]),
    Square(order: .StateAve, group: .Purple, price: 140,            rents: [10, 50, 150, 450, 625, 750]),
    Square(order: .VirginiaAve, group: .Purple, price: 160,         rents: [12, 60, 180, 500, 700, 900]),
    
    Square(order: .PennsylvaniaRR, group: .Railroad, price: 200,    rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .StJamesPlace, group: .Orange, price: 180,        rents: [14, 60, 180, 500, 700, 900]),
    Square(order: .CommunityChest2, group: .CommunityChest),
    Square(order: .TennesseeAve, group: .Orange, price: 180,        rents: [14, 60, 180, 500, 700, 900]),
    Square(order: .NewYorkAve, group: .Orange, price: 200,          rents: [16, 80, 220, 600, 800, 1000]),
    
    Square(order: .FreeParking, group: .Safe),
    Square(order: .KentuckyAve, group: .Red, price: 220,            rents: [18, 90, 250, 700, 875, 1050]),
    Square(order: .Chance2, group: .Chance),
    Square(order: .IndianaAve, group: .Red, price: 220,             rents: [18, 90, 250, 700, 875, 1050]),
    Square(order: .IllinoisAve, group: .Red, price: 240,            rents: [20, 100, 300, 750, 925, 1100]),
    
    Square(order: .BandORR, group: .Railroad, price: 200,           rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .AtlanticAve, group: .Yellow, price: 260,         rents: [22, 110, 330, 800, 975, 1150]),
    Square(order: .VentnorAve, group: .Yellow, price: 260,          rents: [22, 110, 330, 800, 975, 1150]),
    Square(order: .WaterWorks, group: .Utility, price: 150,         rents: [0, 4, 11, 0, 0, 0]),
    Square(order: .MarvinGardens, group: .Yellow, price: 280,       rents: [24, 120, 360, 850, 1025, 1200]),
    
    Square(order: .GoToJail, group: .Movement),
    Square(order: .PacificAve, group: .Green, price: 300,           rents: [26, 130, 390, 900, 1100, 1275]),
    Square(order: .NorthCarolinaAve, group: .Green, price: 300,     rents: [26, 130, 390, 900, 1100, 1275]),
    Square(order: .CommunityChest3, group: .CommunityChest),
    Square(order: .PennsylvaniaAve, group: .Green, price: 320,      rents: [28, 150, 450, 1000, 1200, 1400]),
    
    Square(order: .ShortLineRR, group: .Railroad, price: 200,       rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .Chance3, group: .Chance),
    Square(order: .ParkPlace, group: .Blue, price: 350,             rents: [35, 175, 500, 1100, 1300, 1500]),
    Square(order: .LuxuryTax, group: .Tax),
    Square(order: .Boardwalk, group: .Blue, price: 400,             rents: [50, 200, 600, 1400, 1700, 2000]),
]

    
