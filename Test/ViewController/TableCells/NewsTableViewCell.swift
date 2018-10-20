//
//  NewsTableViewCell.swift
//  Test
//
//  Created by Hussain Chhatriwala on 18/10/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgView.layer.cornerRadius = 30
        self.imgView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func loadCellForNews(news: Result) {
        self.titleLabel.text = news.title
        self.subtitleLabel.text = news.abstractField
        self.dateLabel.text = news.publishedDate
        self.detailTitleLabel.text = news.source
        if let media = news.media?.first?.mediametadata?.first {
            self.imgView.downloaded(from: media.url ?? "", contentMode: .scaleAspectFit)
        }
    }
}
