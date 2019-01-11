//
//  ViewControllerBotones.swift
//  Actividad1
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 wenceslao. All rights reserved.
//

import UIKit

class ViewControllerBotones: UIViewController {
    var txtTitulo:String?

    @IBOutlet weak var lblTitulo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(txtTitulo)

        lblTitulo.text = txtTitulo
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
