//
//  ViewController.swift
//  FriendListApp
//
//  Created by Veldanov, Anton on 6/17/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
  
  
  @IBOutlet weak var helloLabel: UILabel!
  @IBOutlet weak var nameEntryTextField: UITextField!
  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var namesLabel: UILabel!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }
  
  func bind(){
    nameEntryTextField.rx.text
      .map{
      "Hello \($0!)."
    }
    .bind(to: helloLabel.rx.text)
  .disposed(by: disposeBag)
    
  }


}

