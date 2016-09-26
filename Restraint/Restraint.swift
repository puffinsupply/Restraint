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
    _ leftItem:       AnyObject,
    _ leftAttribute:  NSLayoutAttribute,
    _ relation:       NSLayoutRelation,
    _ rightItem:      AnyObject,
    _ rightAttribute: NSLayoutAttribute,
    _ multiplier:     CGFloat,
    _ constant:       CGFloat
    ) {
      self.leftItem       = leftItem
      self.leftAttribute  = leftAttribute
      self.relation       = relation
      self.rightItem      = rightItem
      self.rightAttribute = rightAttribute
      self.multiplier     = multiplier
      self.constant       = constant
  }

  public init(
    _ leftItem:       AnyObject,
    _ leftAttribute:  NSLayoutAttribute,
    _ relation:       NSLayoutRelation,
    _ rightItem:      AnyObject,
    _ rightAttribute: NSLayoutAttribute
    ) {
      self.leftItem       = leftItem
      self.leftAttribute  = leftAttribute
      self.relation       = relation
      self.rightItem      = rightItem
      self.rightAttribute = rightAttribute
      self.multiplier     = 1
      self.constant       = 0
  }

  public init(
    _ leftItem:       AnyObject,
    _ leftAttribute:  NSLayoutAttribute,
    _ relation:       NSLayoutRelation,
    _ constant:       CGFloat
    ) {
      self.leftItem       = leftItem
      self.leftAttribute  = leftAttribute
      self.relation       = relation
      self.rightItem      = nil
      self.rightAttribute = .notAnAttribute
      self.multiplier     = 1
      self.constant       = constant
  }

  // MARK: Public

  public func constraint() -> NSLayoutConstraint {
    return NSLayoutConstraint(
      item:       leftItem,
      attribute:  leftAttribute,
      relatedBy:  relation,
      toItem:     rightItem,
      attribute:  rightAttribute,
      multiplier: multiplier,
      constant:   constant
    )
  }

  public func addToView(_ view: UIView) -> NSLayoutConstraint {
    let constraint = self.constraint()

    if let leftView = leftItem as? UIView {
      leftView.translatesAutoresizingMaskIntoConstraints = false
    }

    view.addConstraint(constraint)

    return constraint
  }

  // MARK: Private

  private let leftItem:       AnyObject
  private let leftAttribute:  NSLayoutAttribute
  private let relation:       NSLayoutRelation
  private let rightItem:      AnyObject?
  private let rightAttribute: NSLayoutAttribute
  private let multiplier:     CGFloat
  private let constant:       CGFloat
  
}
