//
//  Clases.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 wenceslao. All rights reserved.
//

//celda.lblNombre2.text = "Wenceslao"
//celda.lblNoEmpleeado.text = "684276"
//celda.lblPuesto2.text = "jefe"
//celda.imgCobranza.image = UIImage(named: "contactos.png")
import Foundation
public class Empleado{
    var nombre: String
    var noEmpleado: Int
    var puesto:String
    init(Nombre:String,NoEmpleado: Int,Puesto: String){
        self.nombre = Nombre
        self.noEmpleado = NoEmpleado
        self.puesto = Puesto
        
    }
}
var listaEmpleado = [Empleado]()
//Contacto contacto = Contacto.init(Nombre: "wenceslao", NoEmpleado: 684276, Puesto: "Cobranza")
