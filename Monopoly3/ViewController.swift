//
//  ViewController.swift
//  Monopoly3
//
//  Created by Stefano Casafranca Laos on 11/25/24.
//

import UIKit

var player = Player(name: "Stefano", token: .Car)

class ViewController: UIViewController {
    
    @IBOutlet weak var inJailImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var tokenImage: UIImageView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var getOutOfJailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forTestPlayer()
        displayPlayer()
    }
    
    func displayPlayer(){
        inJailImage.image = UIImage(named: "InJail")
        tokenImage.image = UIImage(named: "\(player.token)")
        playerName.text = player.name
        moneyLabel.text = "$\(player.money)"
        getOutOfJailLabel.text = "You have \(player.getOutOfJailCards) get out of jail cards"
        
    }

    func forTestPlayer() {
        player.inJail = true
        player.getOutOfJailCards = 1
        player.money -= 200
        player.ownedProperties
            .append(OwnedProperty(nameOfProperty: .Boardwalk, group: .Blue, mortgaged: true, building: .Hotel))
        player.ownedProperties.append(OwnedProperty(nameOfProperty: .ParkPlace, group: .Blue,mortgaged: true, building: .Hotel))
        
        player.ownedProperties.append(OwnedProperty(nameOfProperty: .IllinoisAve, group: .Red,mortgaged: true, building: .house3))
        player.ownedProperties.append(OwnedProperty(nameOfProperty: .IndianaAve, group: .Red,mortgaged: true, building: .house3))
        player.ownedProperties
            .append(OwnedProperty(nameOfProperty: .KentuckyAve, group: .Red,mortgaged: true, building: .Hotel))
        player.ownedProperties.append(OwnedProperty(nameOfProperty: .ReadingRR, group: .Railroad,mortgaged: true, building: .Hotel))
    
    }
                    
    

}



