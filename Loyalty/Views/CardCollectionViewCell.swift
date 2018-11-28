//
//  CardCollectionViewCell.swift
//  Loyalty
//
//  Created by Alain on 26/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var codeImage: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardId: UILabel!
    @IBOutlet weak var cardDate: UILabel!
    @IBOutlet weak var cardProgress: UILabel!
}
