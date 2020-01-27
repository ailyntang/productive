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
    
    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.register(CreateHabitCollectionViewCell.self, forCellWithReuseIdentifier: Text.cellIdentifier)
        }
    }
    
    private var viewModel: CreateHabitViewModel!
    
    // Collection View Properties
    private let itemsPerRow: CGFloat = 4
    private let inset: CGFloat = 20
    private lazy var sectionInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    

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
    collectionView.register(CreateHabitCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Text.sectionHeaderIdentifier)
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
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Text.cellIdentifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: Text.sectionHeaderIdentifier,
                                                                   for: indexPath) as! CreateHabitCollectionReusableView

        print(view)
        view.setSectionHeaderTo("yoyoyoyoyoyoyo")  // TODO: this is failing as the titleLabel is nil.
        view.backgroundColor = .red
        return view
    }
}

extension CreateHabitViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = inset * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
}

private enum Text {
    static let cellIdentifier = "CollectionViewCell"
    static let sectionHeaderIdentifier = "SectionHeader"
}
