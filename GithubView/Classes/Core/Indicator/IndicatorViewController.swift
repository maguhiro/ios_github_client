import UIKit

final class IndicatorViewController: UIViewController {
  @IBOutlet private var indicator: UIActivityIndicatorView!

  init() {
    super.init(nibName: nil, bundle: Bundle(for: IndicatorViewController.self))
    self.modalPresentationStyle = .overCurrentContext
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    indicator.startAnimating()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    indicator.stopAnimating()
  }
}
