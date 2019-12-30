//
//  ChooseNameAndIconViewController.swift
//  productive
//
//  Created by Ai-Lyn Tang on 24/10/19.
//  Copyright © 2019 CoderLyn. All rights reserved.
//

import UIKit

final class CreateHabitViewController: UIViewController {
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(cellType: IconTitleCell.self)
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(CreateHabitCollectionViewCell.self, forCellWithReuseIdentifier: Text.cellIdentifier)
        }
    }
    
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

extension CreateHabitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellType: IconTitleCell.self, for: indexPath)
        
        // The image color hasn't gone grey
        let imageView = UIImageView(image: UIImage(named: Icon.pencil)?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .red
        
        cell.configure(with: IconTitleCellDisplayModel(icon: imageView.image!, title: "Name of habit"))
        cell.textLabel?.textColor = .red
        return cell
    }
}

extension CreateHabitViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Text.cellIdentifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}

private enum Text {
    static let cellIdentifier = "CollectionViewCell"
}
