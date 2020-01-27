//
//  CreateHabitCollectionReusableView.swift
//  productive
//
//  Created by Ai-Lyn Tang on 31/12/19.
//  Copyright © 2019 CoderLyn. All rights reserved.
//

import UIKit

final class CreateHabitCollectionReusableView: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!
    
    func setSectionHeaderTo(_ sectionHeader: String) {
        titleLabel?.text = sectionHeader
    }
}
