//
//  ChooseNameAndIconViewController.swift
//  productive
//
//  Created by Ai-Lyn Tang on 24/10/19.
//  Copyright © 2019 CoderLyn. All rights reserved.
//

import UIKit

final class CreateHabitViewController: UIViewController {
    
    // MARK: Properites
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(cellType: IconTitleCell.self)
        }
    }
    
    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.register(CreateHabitCollectionViewCell.self, forCellWithReuseIdentifier: Text.cellIdentifier)
//            collectionView.register(CreateHabitHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Text.sectionHeaderIdentifier)
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: iconWidth, height: iconWidth)
            layout.minimumInteritemSpacing = inset
            layout.minimumLineSpacing = inset
            layout.headerReferenceSize = CGSize(width: 0, height: inset)
            layout.sectionHeadersPinToVisibleBounds = true
            layout.sectionInset = sectionInsets
            collectionView.collectionViewLayout = layout
        }
    }
    
    private var viewModel: CreateHabitViewModel!
    
    // Collection View Properties
    private let iconWidth: CGFloat = 50
    private let inset: CGFloat = 40
    private lazy var sectionInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    
    // MARK: Initialization
    
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
        collectionView.register(CreateHabitHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Text.sectionHeaderIdentifier)
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
        cell.textLabel?.textColor = .red // This doesn't make the text red
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
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Text.sectionHeaderIdentifier, for: indexPath) as! CreateHabitHeaderView
        headerView.render()
        return headerView
    }
}

private enum Text {
    static let cellIdentifier = "CollectionViewCell"
    static let sectionHeaderIdentifier = "SectionHeader"
}
