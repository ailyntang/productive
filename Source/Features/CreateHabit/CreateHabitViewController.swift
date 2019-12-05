//
//  ChooseNameAndIconViewController.swift
//  productive
//
//  Created by Ai-Lyn Tang on 24/10/19.
//  Copyright © 2019 CoderLyn. All rights reserved.
//

import UIKit

final class CreateHabitViewController: UIViewController {
  private var viewModel: CreateHabitViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: CreateHabitViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
  }
}
