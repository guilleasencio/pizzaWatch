//
//  vistaQueso.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import WatchKit
import Foundation


class vistaQueso: WKInterfaceController {
    
    
    var pizza: Pizza = Pizza()

    @IBOutlet var siguienteBoton: WKInterfaceButton!
    @IBOutlet var quesoLabel: WKInterfaceLabel!
    @IBOutlet var quesoSlider: WKInterfaceSlider!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.pizza = context as! Pizza
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.quesoLabel.setText(self.pizza.verQueso())
        self.quesoSlider.setValue(Float(self.pizza.obtenerIndiceQueso()))
        self.siguienteBoton.setHidden(self.pizza.verModoEdicion())
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func cambiarQueso(value: Float) {
        self.pizza.cambiarQueso(Int(value))
        self.quesoLabel.setText(self.pizza.verQueso())

    }

    @IBAction func cambiarAIngredientes() {
        pushControllerWithName("EditorIngredientes", context: self.pizza)
    }
}
