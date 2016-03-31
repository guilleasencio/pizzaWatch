//
//  vistaEditar.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import WatchKit
import Foundation


class vistaEditar: WKInterfaceController {
    
    var pizza: Pizza = Pizza()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.pizza = context as! Pizza
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.pizza.activarModoEdicion()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func editarTamaño() {
        pushControllerWithName("EditorTamaño", context: self.pizza)
    }
    @IBAction func editarMasa() {
        pushControllerWithName("EditorMasa", context: self.pizza)
    }
    
    @IBAction func editarQueso() {
        pushControllerWithName("EditorQueso", context: self.pizza)
    }
    @IBAction func editarIngredientes() {
        pushControllerWithName("EditorIngredientes", context: self.pizza)
    }
}
