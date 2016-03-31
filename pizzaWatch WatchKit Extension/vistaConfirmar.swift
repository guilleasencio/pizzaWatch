//
//  vistaConfirmar.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import WatchKit
import Foundation


class vistaConfirmar: WKInterfaceController {

    var pizza: Pizza = Pizza()
    
    @IBOutlet var tamañoLabel: WKInterfaceLabel!
    @IBOutlet var masaLabel: WKInterfaceLabel!
    @IBOutlet var quesoLabel: WKInterfaceLabel!
    
    @IBOutlet var ingredientesTabla: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.pizza = context as! Pizza
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.tamañoLabel.setText(self.pizza.verTamaño())
        self.masaLabel.setText(self.pizza.verMasa())
        self.quesoLabel.setText(self.pizza.verQueso())
        self.inicializarTabla()
        self.pizza.desactivarModoEdicion()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func inicializarTabla() {
        var ingredientes = self.pizza.verIngredientes()
        ingredientesTabla.setNumberOfRows(ingredientes.count, withRowType: "Ingrediente")
        
        for i in 0 ..< ingredientes.count {
            if let fila = ingredientesTabla.rowControllerAtIndex(i) as? Ingrediente {
                fila.ingredienteLabel.setText(ingredientes[i])                
            }
        }
    }


    @IBAction func cambiarAEditar() {
        pushControllerWithName("EditarPizza", context: self.pizza)
    }
    
    @IBAction func cambiarAConfirmado() {
        let ingredientesSeleccionados : Int = self.pizza.totalIngredientes()
        if ingredientesSeleccionados > 0 {
            pushControllerWithName("PedidoRealizado", context: self.pizza)
        }else{
            let aceptar = WKAlertAction(title: "Aceptar", style: WKAlertActionStyle.Default){}
            presentAlertControllerWithTitle("Error al confirmar",
                                            message: "Debe seleccionar al menos un ingrediente para su pizza",
                                            preferredStyle: WKAlertControllerStyle.Alert,
                                            actions: [aceptar])
            
            
        }
        
    }
}
