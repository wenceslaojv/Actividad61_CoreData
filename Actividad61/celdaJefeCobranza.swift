//
//  celdaJefeCobranza.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 wenceslao. All rights reserved.
//

import UIKit

class celdaJefeCobranza: UITableViewCell {


    @IBOutlet weak var imgCobranza: UIImageView!
    @IBOutlet weak var lblNombre2: UILabel!
    @IBOutlet weak var lblPuesto2: UILabel!
    @IBOutlet weak var lblNoEmpleeado: UILabel!
    
    @IBOutlet weak var btnRuta: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
