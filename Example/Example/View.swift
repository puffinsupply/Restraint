import UIKit
import Restraint


class View: UIView {

  // MARK: Initializers

  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    backgroundColor  = UIColor(hue:0.39, saturation:0.8, brightness:1, alpha:1)

    topLabel.text  = "Restraint"
    topLabel.font  = UIFont.boldSystemFont(ofSize: 32.0)
    topLabel.alpha = 0.25

    bottomLabel.text          = "Restraint is a tiny Swift framework provided as part of the Puffin Supply Project."
    bottomLabel.alpha         = 0.25
    bottomLabel.numberOfLines = 0
    bottomLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    bottomLabel.textAlignment = NSTextAlignment.center

    addSubview(imageView)
    addSubview(topLabel)
    addSubview(bottomLabel)

    let imageViewSize = CGFloat(200)

    // MARK: Image View Constraints

    Restraint(imageView, .width,  .equal, imageViewSize).addToView(self)
    Restraint(imageView, .height, .equal, imageViewSize).addToView(self)

    Restraint(imageView, .centerX, .equal, self, .centerX).addToView(self)
    Restraint(imageView, .centerY, .equal, self, .centerY).addToView(self)

    // MARK: Top Label Constraints

    Restraint(topLabel, .centerX, .equal, imageView, .centerX).addToView(self)
    Restraint(topLabel, .centerY, .equal, imageView, .top, 0.5, 0).addToView(self)

    // MARK: Bottom Label Constraints

    if #available(iOS 9.0, *) {
      Restraint(bottomLabel, .leading,  .equal, layoutMarginsGuide, .leading).addToView(self)
      Restraint(bottomLabel, .trailing, .equal, layoutMarginsGuide, .trailing).addToView(self)
    } else {
      Restraint(bottomLabel, .left,  .equal, self, .leftMargin).addToView(self)
      Restraint(bottomLabel, .right, .equal, self, .rightMargin).addToView(self)
    }

    Restraint(bottomLabel, .centerY, .equal, self, .centerY, 1.5, (imageViewSize / 4)).addToView(self)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private let imageView   = UIImageView(image: UIImage(named: "puffin_supply"))
  private let topLabel    = UILabel()
  private let bottomLabel = UILabel()
}
