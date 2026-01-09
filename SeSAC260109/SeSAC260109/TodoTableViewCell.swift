//
//  TodoTableViewCell.swift
//  SeSAC260109
//
//  Created by 석민솔 on 1/9/26.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        
        todoLabel.text = "테스트 레이블"
        todoLabel.textColor = .label
        
        checkButton.setTitle("", for: .normal)
        let circleConfig = UIImage.SymbolConfiguration(weight: .light)
        let circleImage = UIImage(systemName: "circle", withConfiguration: circleConfig)
        checkButton.setImage(circleImage, for: .normal)
        
        starButton.setTitle("", for: .normal)
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        
        backgroundColor = .white
    }
}
