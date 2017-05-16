//
//  MovieTableViewCell.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    // Constants
    private static let RateTextFormat = "%0.1f"
    
    private struct AnimationConstants {
        
        static let Duration = 0.75
        static let DefaultAlpha = 1.0
        static let HighlightedAlpha = 0.5
    }
    
    // Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(withDuration: AnimationConstants.Duration) {
            self.contentView.alpha = CGFloat(highlighted ? AnimationConstants.HighlightedAlpha : AnimationConstants.DefaultAlpha)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Cancel image download operation if exists.
        backgroundImageView.sd_cancelCurrentImageLoad()
    }
    
    // MARK: - Initialization Helpers -
    
    func setRate(_ rate: Float) {
        rateLabel.text = String(format: MovieTableViewCell.RateTextFormat, rate)
    }
    
    func setImageLink(_ link: String) {
        let imageURL = URL(string: link)
        backgroundImageView.sd_setImage(with: imageURL)
    }
}
