//
//  NasaListController.swift
//  NasaNews
//
//  Created by Mervin Flores on 2/29/24.
//

import UIKit

class NasaItemCell: UITableViewCell {
    @IBOutlet weak var imgNasa: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var cellContainer: UIView!
    
    static let identifier = "NasaItemCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCellViewsShape()
    }
    
    private func setupCellViewsShape() {
        cellContainer.applyBorderWithCornerRadius()
        imgNasa.applyBorderWithCornerRadius(borderColor:.clear
        )
    }
    
    func configure(_ dataItem: NasaItem.DataItem) {
        imgNasa.image = nil
        lblTitle.text = Util.getText(dataItem.title ?? "")
        lblName.text = Util.getText(dataItem.name ?? "")
        lblDate.text = DateHelper.shared.formatToMediumDate(dataItem.dateCreated ?? Date())
        let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.clear // Establecer el color de fondo en transparente
        self.selectedBackgroundView = backgroundView
        
    }
    
}
