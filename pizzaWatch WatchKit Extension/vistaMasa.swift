//
//  vistaMasa.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import WatchKit
import Foundation


class vistaMasa: WKInterfaceController {
    
    var pizza: Pizza = Pizza()

    @IBOutlet var siguienteBoton: WKInterfaceButton!
    @IBOutlet var masaSlider: WKInterfaceSlider!
    @IBOutlet var masaLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.pizza = context as! Pizza
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.masaLabel.setText(self.pizza.verMasa())
        self.masaSlider.setValue(Float(self.pizza.obtenerIndiceMasa()))
        self.siguienteBoton.setHidden(self.pizza.verModoEdicion())
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func cambiarMasa(value: Float) {
        self.pizza.cambiarMasa(Int(value))
        self.masaLabel.setText(self.pizza.verMasa())
    }
    @IBAction func cambiarAQueso() {
        pushControllerWithName("EditorQueso", context: self.pizza)
    }
}
