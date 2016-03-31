//
//  vistaIngredientes.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import WatchKit
import Foundation


class vistaIngredientes: WKInterfaceController {

    @IBOutlet var seleccionadosLabel: WKInterfaceLabel!
    
    @IBOutlet var restantesLabel: WKInterfaceLabel!
    
    @IBOutlet var siguienteBoton: WKInterfaceButton!
    var pizza: Pizza = Pizza()
    var ingredientesDisponibles : [String] = []
    let maximoIngredientes : Int = 5
    
    @IBOutlet var ingredientesTable: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.pizza = context as! Pizza
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.ingredientesDisponibles = self.pizza.ingredientesParaPizza()
        self.inicializarTabla()
        
        let ingredientesSeleccionados : Int = self.pizza.totalIngredientes()
        let ingredientesRestantes : Int = self.maximoIngredientes - ingredientesSeleccionados
        
        self.seleccionadosLabel.setText("Selecionados: \(String(ingredientesSeleccionados))")
        self.restantesLabel.setText("Restantes: \(String(ingredientesRestantes))")
        
        if ingredientesSeleccionados > 0 {
            self.siguienteBoton.setHidden(self.pizza.verModoEdicion())
        }else{
            self.siguienteBoton.setHidden(true)
            
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func inicializarTabla() {
        ingredientesDisponibles = self.pizza.ingredientesParaPizza()
        ingredientesTable.setNumberOfRows(ingredientesDisponibles.count, withRowType: "Ingrediente")
        
        for i in 0 ..< ingredientesDisponibles.count {
            if let fila = ingredientesTable.rowControllerAtIndex(i) as? Ingrediente {
                fila.ingredienteLabel.setText(ingredientesDisponibles[i])
                if self.pizza.tieneIngrediente(ingredientesDisponibles[i]) {
                    fila.ingredienteLabel.setTextColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 5/255.0, alpha: 1))
                }else{
                    fila.ingredienteLabel.setTextColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1))
                }
                
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let ingredienteRow = table.rowControllerAtIndex(rowIndex) as? Ingrediente
        if self.pizza.tieneIngrediente(ingredientesDisponibles[rowIndex]) {
            self.pizza.quitarIngrediente(ingredientesDisponibles[rowIndex])
            ingredienteRow!.ingredienteLabel.setTextColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1))
        }else{
            if(self.pizza.totalIngredientes() < self.maximoIngredientes){
                self.pizza.añadirIngrediente(ingredientesDisponibles[rowIndex])
                ingredienteRow!.ingredienteLabel.setTextColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 5/255.0, alpha: 1))
            }
        }
        
        let ingredientesSeleccionados : Int = self.pizza.totalIngredientes()
        let ingredientesRestantes : Int = self.maximoIngredientes - ingredientesSeleccionados
        
        self.seleccionadosLabel.setText("Selecionados: \(String(ingredientesSeleccionados))")
        self.restantesLabel.setText("Restantes: \(String(ingredientesRestantes))")
        
        if ingredientesSeleccionados > 0 {
            self.siguienteBoton.setHidden(self.pizza.verModoEdicion())
        }else{
            self.siguienteBoton.setHidden(true)
            
        }
    }
    
    
    @IBAction func cambiarAConfirmar() {
        pushControllerWithName("ConfirmarPizza", context: self.pizza)
    }

}
