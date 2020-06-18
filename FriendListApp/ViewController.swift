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
  @IBOutlet weak var addNameButton: UIButton!
  
  let disposeBag = DisposeBag()
  var namesArray = BehaviorRelay<[String]>(value: [])
  override func viewDidLoad() {
    super.viewDidLoad()
    bindTextField()
    bindSubmitButton()
  }
  
  func bindTextField(){
    nameEntryTextField.rx.text
      .debounce(.milliseconds(5), scheduler: MainScheduler.instance)
      .map{
        if $0 == ""{
          
          return "Type your name below: "
        }else{
         return "Hello \($0!)."
        }
    }
    
    .bind(to: helloLabel.rx.text)
  .disposed(by: disposeBag)
    
  }
  
  
  func bindSubmitButton(){
    submitButton.rx.tap.subscribe(onNext: {
      if self.nameEntryTextField.text != ""{
        self.namesArray.accept(self.namesArray.value + [self.nameEntryTextField.text!])
        self.namesLabel.rx.text.onNext(self.namesArray.value.joined(separator: ", "))
        self.nameEntryTextField.rx.text.onNext("")
        self.helloLabel.rx.text.onNext("Type your name below: ")
      }
      }).disposed(by: disposeBag)
    
    
  }
  
  
  
  func bindAddNameButton(){
    addNameButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: {
      guard let addNameVC = self.storyboard?.instantiateViewController(identifier: "AddNameViewController") as? AddNameViewController else {
        fatalError("Could not create addNameVC")
      }
      
      addNameVC.nameSubject
    })
    
    
  }


}

