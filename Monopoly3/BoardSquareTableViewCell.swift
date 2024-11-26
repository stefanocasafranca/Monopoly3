//
//  BoardSquareTableViewCell.swift
//  Monopoly1
//
//  Created by Stefano Casafranca Laos on 11/12/24.
//

import UIKit

class BoardSquareTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var squareNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet var house: [UIImageView]!
    
    
    @IBOutlet weak var railroadName: UILabel!
    
    @IBOutlet weak var railroadPrice: UILabel!
    
    @IBOutlet weak var railroadImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setColor(byGroupName: Group){

        switch byGroupName {
        case .DarkPurple:
            colorButton.backgroundColor = .brown
        case .LightBlue:
            colorButton.backgroundColor = UIColor(red: 173.0/255.0, green: 216.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        case .Purple:
            colorButton.backgroundColor = .purple
        case .Orange:
            colorButton.backgroundColor = .orange
        case .Red:
            colorButton.backgroundColor = .red
        case .Yellow:
            colorButton.backgroundColor = .yellow
        case .Green:
            colorButton.backgroundColor = .green
        case .Blue:
            colorButton.backgroundColor = .blue
        default:
            colorButton.backgroundColor = .gray
            
        }
    }
    
    func configure(withDataFromSquare square: Square) {
        
        setColor(byGroupName: square.group)
        colorButton.setTitle("\(square.name)", for: .normal)
        squareNameLabel.text = "Property: \(square.name)"
        priceLabel.text = "Price: $\(square.price)"
        house[0].image = UIImage(named: "House")
        house[1].image = nil
        house[2].image = nil
        house[3].image = nil
        
    }
        
}

