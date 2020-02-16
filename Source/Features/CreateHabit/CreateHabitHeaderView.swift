//
//  CreateHabitHeaderView.swift
//  productive
//
//  Created by Ai-Lyn Tang on 27/1/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import UIKit

final class CreateHabitHeaderView: UICollectionReusableView {
    @IBOutlet private var headerLabel: UILabel!
    
    func render() {
        headerLabel?.text = "Pick an icon"
    }
}
