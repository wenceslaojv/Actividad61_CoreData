//
//  ViewControllerJefesCobranza.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 wenceslao. All rights reserved.
//

import UIKit

class ViewControllerJefesCobranza: UIViewController {

    @IBOutlet weak var tblJefesCobranza: UITableView!
    var valueToPass = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblJefesCobranza.dataSource = self
        tblJefesCobranza.delegate = self
        tblJefesCobranza.rowHeight = 134

//        Contacto contacto =
        listaEmpleado.append(Empleado.init(Nombre: "wenceslao", NoEmpleado: 684276, Puesto: "Cobranza"))
        listaEmpleado.append(Empleado.init(Nombre: "eliana", NoEmpleado: 684277, Puesto: "Cobranza"))
        listaEmpleado.append(Empleado.init(Nombre: "patricia", NoEmpleado: 684278, Puesto: "Cobranza"))
        listaEmpleado.append(Empleado.init(Nombre: "roman", NoEmpleado: 684279, Puesto: "Cobranza"))
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMapas" {
            if let vcd = segue.destination as? ViewControllerRutaJefeCobranza{
                //            valueToPass = 684279
                print("valor antes de cambiar pantalla \(self.valueToPass)")
                vcd.numeroEmpleado = self.valueToPass

            }
        }
    }
  
    
    


}
extension ViewControllerJefesCobranza : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmpleado.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCobranza", for: indexPath) as! celdaJefeCobranza
        let row = indexPath.row
        
        celda.lblNombre2.text = listaEmpleado[row].nombre
        celda.lblNoEmpleeado.text = String(listaEmpleado[row].noEmpleado)
        celda.lblPuesto2.text = listaEmpleado[row].puesto
        celda.imgCobranza.image = UIImage(named: "contactos.png")
        
        return celda
    }
    
    
}

extension ViewControllerJefesCobranza: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tblJefesCobranza.indexPathForSelectedRow!
        let currentCell = tblJefesCobranza.cellForRow(at: indexPath)! as! celdaJefeCobranza
        
        self.valueToPass = Int(currentCell.lblNoEmpleeado.text!)!
        
        performSegue(withIdentifier: "segueMapas", sender: self)
    }
}
