import GithubPresentation
import Nuke
import UIKit

class MyPageViewController: UIViewController {
  private let presenter = MyPagePresenter()

  @IBOutlet private var iconImageView: UIImageView!
  @IBOutlet private var accountNameLabel: UILabel!
  @IBOutlet private var nicknameLabel: UILabel!
  @IBOutlet private var repositoriesAmountLabel: UILabel!
  @IBOutlet private var gistsAmountLabel: UILabel!
  @IBOutlet private var followersAmountLabel: UILabel!
  @IBOutlet private var followingAmountLabel: UILabel!

  init() {
    super.init(nibName: nil, bundle: Bundle(for: MyPageViewController.self))
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
    presenter.view = self
    presenter.showPage()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    presenter.view = nil
  }
}

private extension MyPageViewController {
  @IBAction func didTapLogoutBtn() {
    presenter.signOut()
  }
}

extension MyPageViewController: MyPageView {
  func render(viewModel: MyPageViewModel) {
    iconImageView.setImage(url: viewModel.iconURL)
    accountNameLabel.text = viewModel.accountName
    nicknameLabel.text = viewModel.nickname
    repositoriesAmountLabel.text = viewModel.repositorisAmountText
    gistsAmountLabel.text = viewModel.gistsAmountText
    followersAmountLabel.text = viewModel.followersAmountText
    followingAmountLabel.text = viewModel.followingAmountText
  }
}
