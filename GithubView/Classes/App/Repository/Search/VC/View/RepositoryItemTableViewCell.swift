import GithubPresentation
import UIKit

final class RepositoryItemTableViewCell: UITableViewCell {
  @IBOutlet private var iconImageView: UIImageView!
  @IBOutlet private var repositoryNameLabel: UILabel!
  @IBOutlet private var descriptionLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    iconImageView.cancel()
  }
}

extension RepositoryItemTableViewCell {
  func render(viewModel: RepositoryItemViewModel) {
    iconImageView.setImage(url: viewModel.iconURL)
    repositoryNameLabel.text = viewModel.repositoryName
    descriptionLabel.text = viewModel.description
  }
}
