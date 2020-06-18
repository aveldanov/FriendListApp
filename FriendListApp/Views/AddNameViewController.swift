//
//  AddNameViewController.swift
//  FriendListApp
//
//  Created by Veldanov, Anton on 6/17/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddNameViewController: UIViewController {

  let disposeBag = DisposeBag()
  let nameSubject = PublishSubject<String>()
  
  
  @IBOutlet weak var newNameTextField: UITextField!
  @IBOutlet weak var submitNameButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

 

}
