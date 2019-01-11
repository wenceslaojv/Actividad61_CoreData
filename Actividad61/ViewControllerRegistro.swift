//
//  ViewControllerRegistro.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 wenceslao. All rights reserved.
//

import UIKit

class ViewControllerRegistro: UIViewController {

  
    var strNombre:String?
    var strContraseña:String?
    var strConfirContraseña:String?
    var strEmail:String?
    var strFecha:String?
    var strNoEmpleado:String?
    var strTelefono:String?
    
    @IBAction func txtNombre(_ sender: UITextField) {
        self.strNombre = sender.text!
    }
    @IBAction func txtContrasenia(_ sender: UITextField) {
        self.strContraseña = sender.text!
    }
    
    @IBAction func txtConfirContrasenia(_ sender: UITextField) {
        self.strConfirContraseña = sender.text!
    }
    @IBAction func txtEmail(_ sender: UITextField) {
        self.strEmail = sender.text!
    }
    @IBAction func txtFecha(_ sender: UITextField) {
        self.strFecha = sender.text!
    }
    @IBAction func txtNoEmpleado(_ sender: UITextField) {
        self.strNoEmpleado = sender.text!
    }
    @IBAction func txtTelefono(_ sender: UITextField) {
        self.strTelefono = sender.text!
    }
    
    @IBAction func btnRegistro(_ sender: UIButton) {
        if validaRegistros(){
            print("entra a guardar")
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func validaRegistros() -> Bool{
        
        guard let letusuario = self.strNombre else {
            print("Favor de llenar el nombre por favor.")
            return false
        }
        guard  let letcontrasenia = self.strContraseña else {
            print("Favor de llenar la contraseña por favor.")
            return false
        }
        guard  let letconfircontrasenia = self.strConfirContraseña else {
            print("Favor de llenar la confirmacion de la contraseña por favor.")
            return false
        }
        guard  let letEmail = self.strEmail else {
            print("Favor de llenar el email")
            return false
        }
        guard  let letFecha = self.strFecha else {
            print("Favor de llenar la fecha")
            return false
        }
        guard  let letNoEmpleado = self.strNoEmpleado else {
            print("Favor de llenar el numero de empleado")
            return false
        }
        guard  let letTelefono = self.strTelefono else {
            print("Favor de llenar el numero de telefono")
            return false
        }
        return true;
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
