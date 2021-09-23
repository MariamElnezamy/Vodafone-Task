//
//  KeyboardHandlar.swift
//  Vodafone Task
//
//  Created by Admin on 23/09/2021.
//

import Foundation
import UIKit

protocol KeyboardHandler {
  var barBottomConstraint: NSLayoutConstraint! { get }
  var bottomInset: CGFloat { get }
}

extension KeyboardHandler where Self: UIViewController {
  func addKeyboardObservers(_ completion: CompletionObject<Bool>?  = nil) {
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) {[weak self] (notification) in
      self?.handleKeyboard(notification: notification)
      completion?(true)
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {[weak self] (notification) in
      self?.handleKeyboard(notification: notification)
      completion?(false)
    }
  }
  
  private func handleKeyboard(notification: Notification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
    barBottomConstraint.constant = notification.name == UIResponder.keyboardWillHideNotification ? 0 : keyboardFrame.height - view.safeAreaInsets.bottom - bottomInset
    UIView.animate(withDuration: 0.3) {
    self.view.layoutIfNeeded()
    }
  }
    
}
public typealias CompletionObject<T> = (_ response: T) -> Void
