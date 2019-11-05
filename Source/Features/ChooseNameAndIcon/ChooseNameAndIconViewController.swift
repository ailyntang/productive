//
//  ChooseNameAndIconViewController.swift
//  productive
//
//  Created by Ai-Lyn Tang on 24/10/19.
//  Copyright © 2019 CoderLyn. All rights reserved.
//

import UIKit

final class ChooseNameAndIconViewController: UIViewController {
  private var viewModel: ChooseNameAndIconViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: ChooseNameAndIconViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
  }
}
