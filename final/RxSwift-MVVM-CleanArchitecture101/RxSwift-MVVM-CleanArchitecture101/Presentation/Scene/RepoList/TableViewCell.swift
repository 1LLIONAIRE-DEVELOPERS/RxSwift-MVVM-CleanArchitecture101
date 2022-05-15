//
//  TableViewCell.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Lee Seung-Jae on 2022/05/13.
//

import UIKit
import RxSwift

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureContent(for item: RepoItem) {
        self.ownerNameLabel.text = item.ownerName
        DispatchQueue.global().async {
            let imageData = try! Data(contentsOf:URL( string: item.ownerAvatarURL)!)
            DispatchQueue.main.async {
                self.ownerImage.image = UIImage(data: imageData)
            }
        }
        self.repoNameLabel.text = item.name
        self.repoDescriptionLabel.text = item.description
        self.starCountLabel.text = item.starCount.description
        self.languageLabel.text = item.language
    }

}
