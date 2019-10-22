//
//  ViewController.swift
//  pagination-practice
//
//  Created by jinsei_shima on 2019/09/04.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import EasyPeasy

final class MultipleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

  private let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init())

  private var viewControllers: [UIViewController]

  init(viewControllers: [UIViewController]) {
    
    self.viewControllers = viewControllers

    super.init(nibName: nil, bundle: nil)

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    view.addSubview(collectionView)

    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: String.init(describing: UICollectionViewCell.self))

  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewControllers.count
  }


  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: UICollectionViewCell.self), for: indexPath)
    let viewController = viewControllers[indexPath.row]
    cell.contentView.addSubview(viewController.view)
    viewController.view.easy.layout(
      Size(.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    )
    return cell
  }
}

final class ChildViewController: UIViewController {

  let id: Int

  init(id: Int) {
    self.id = id
    super.init(nibName: nil, bundle: nil)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print(#function, id)

    view.backgroundColor = .lightGray
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print(#function, id)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print(#function, id)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print(#function, id)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print(#function, id)
  }

}

