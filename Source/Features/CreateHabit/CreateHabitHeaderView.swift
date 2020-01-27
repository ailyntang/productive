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
        backgroundColor = .purple
        headerLabel?.text = "Meep morp"    // TODO: this is always nil, why?
        headerLabel?.textColor = .white
    }
}
