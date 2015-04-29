import UIKit
import Restraint


class View: UIView {

  // MARK: Initializers

  init() {
    super.init(frame: CGRectMake(0, 0, 0, 0))

    backgroundColor  = UIColor(hue:0.39, saturation:0.8, brightness:1, alpha:1)

    topLabel.text  = "Restraint"
    topLabel.font  = UIFont.boldSystemFontOfSize(32.0)
    topLabel.alpha = 0.25

    bottomLabel.text          = "Restraint is a tiny Swift framework provided as part of the Puffin Supply Project."
    bottomLabel.alpha         = 0.25
    bottomLabel.numberOfLines = 0
    bottomLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
    bottomLabel.textAlignment = NSTextAlignment.Center

    addSubview(imageView)
    addSubview(topLabel)
    addSubview(bottomLabel)

    var imageViewSize = CGFloat(200)

    // MARK: View Constraints

    Restraint(self, .Width,  .Equal, UIScreen.mainScreen().applicationFrame.width).addToView(self)
    Restraint(self, .Height, .Equal, UIScreen.mainScreen().applicationFrame.height).addToView(self)

    // MARK: Image View Constraints

    Restraint(imageView, .Width,  .Equal, imageViewSize).addToView(self)
    Restraint(imageView, .Height, .Equal, imageViewSize).addToView(self)

    Restraint(imageView, .CenterX, .Equal, self, .CenterX).addToView(self)
    Restraint(imageView, .CenterY, .Equal, self, .CenterY).addToView(self)

    // MARK: Top Label Constraints

    Restraint(topLabel, .CenterX, .Equal, imageView, .CenterX).addToView(self)
    Restraint(topLabel, .CenterY, .Equal, imageView, .Top, 0.5, 0).addToView(self)

    // MARK: Bottom Label Constraints

    Restraint(bottomLabel, .Left,  .Equal, self, .LeftMargin).addToView(self)
    Restraint(bottomLabel, .Right, .Equal, self, .RightMargin).addToView(self)

    Restraint(bottomLabel, .CenterY, .Equal, self, .CenterY, 1.5, (imageViewSize / 4)).addToView(self)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private let imageView   = UIImageView(image: UIImage(named: "puffin_supply"))
  private let topLabel    = UILabel()
  private let bottomLabel = UILabel()
}
