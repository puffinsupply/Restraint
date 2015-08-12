//  The MIT License (MIT)
//
//  Copyright (c) 2015 Adam Michela, The Puffin Supply Project, github.com/puffinsupply/Restraint
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit


public struct Restraint {

  // MARK: Initializers

  public init(
    _ leftView:       UIView,
    _ leftAttribute:  NSLayoutAttribute,
    _ relation:       NSLayoutRelation,
    _ rightView:      UIView,
    _ rightAttribute: NSLayoutAttribute,
    _ multiplier:     CGFloat,
    _ constant:       CGFloat
    ) {
      self.leftView       = leftView
      self.leftAttribute  = leftAttribute
      self.relation       = relation
      self.rightView      = rightView
      self.rightAttribute = rightAttribute
      self.multiplier     = multiplier
      self.constant       = constant
  }

  public init(
    _ leftView:       UIView,
    _ leftAttribute:  NSLayoutAttribute,
    _ relation:       NSLayoutRelation,
    _ rightView:      UIView,
    _ rightAttribute: NSLayoutAttribute
    ) {
      self.leftView       = leftView
      self.leftAttribute  = leftAttribute
      self.relation       = relation
      self.rightView      = rightView
      self.rightAttribute = rightAttribute
      self.multiplier     = 1
      self.constant       = 0
  }

  public init(
    _ leftView:       UIView,
    _ leftAttribute:  NSLayoutAttribute,
    _ relation:       NSLayoutRelation,
    _ constant:       CGFloat
    ) {
      self.leftView       = leftView
      self.leftAttribute  = leftAttribute
      self.relation       = relation
      self.rightView      = nil
      self.rightAttribute = .NotAnAttribute
      self.multiplier     = 1
      self.constant       = constant
  }

  // MARK: Public

  public func constraint() -> NSLayoutConstraint {
    return NSLayoutConstraint(
      item:       leftView,
      attribute:  leftAttribute,
      relatedBy:  relation,
      toItem:     rightView,
      attribute:  rightAttribute,
      multiplier: multiplier,
      constant:   constant
    )
  }

  public func addToView(view: UIView) -> NSLayoutConstraint {
    let constraint = self.constraint()

    view.translatesAutoresizingMaskIntoConstraints = false
    leftView.translatesAutoresizingMaskIntoConstraints = false
    rightView?.translatesAutoresizingMaskIntoConstraints = false

    view.addConstraint(constraint)

    return constraint
  }

  // MARK: Private

  private let leftView:       UIView
  private let leftAttribute:  NSLayoutAttribute
  private let relation:       NSLayoutRelation
  private let rightView:      UIView?
  private let rightAttribute: NSLayoutAttribute
  private let multiplier:     CGFloat
  private let constant:       CGFloat
  
}
