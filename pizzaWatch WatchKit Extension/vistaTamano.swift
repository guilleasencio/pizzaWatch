//
//  vistaTamano.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import WatchKit
import Foundation


class vistaTamano: WKInterfaceController {

    var pizza: Pizza = Pizza()
    
    @IBOutlet var tamañoLabel: WKInterfaceLabel!
    @IBOutlet var tamañoSlider: WKInterfaceSlider!
    
    @IBOutlet var siguienteBoton: WKInterfaceButton!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.pizza = context as! Pizza
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.tamañoLabel.setText(self.pizza.verTamaño())
        self.tamañoSlider.setValue(Float(self.pizza.obtenerIndiceTamaño()))
        self.siguienteBoton.setHidden(self.pizza.verModoEdicion())
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func cambiarTamaño(value: Float) {
        self.pizza.cambiarTamaño(Int(value))
        self.tamañoLabel.setText(self.pizza.verTamaño())
    }
    @IBAction func cambiarAMasa() {
        pushControllerWithName("EditorMasa", context: self.pizza)
    }
}
