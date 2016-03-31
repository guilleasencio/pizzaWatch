//
//  Pizza.swift
//  pizzaWatch
//
//  Created by Guillermo Asencio Sanchez on 31/3/16.
//  Copyright © 2016 Guillermo Asencio Sanchez. All rights reserved.
//

import Foundation

class Pizza {
    var tamaño: String = "chica"
    var tamañoIndice : Int = 1
    var masa: String = "delgada"
    var masaIndice : Int = 1
    var queso: String = "mozarela"
    var quesoIndice : Int = 1
    var ingredientes: [String] = []
    var modoEdicion: Bool = false
    
    let tamañosDisponibles : [Int:String] = [1:"chica",2:"mediana",3:"grande"]
    let masasDisponibles : [Int:String] = [1:"delgada",2:"crujiente",3:"gruesa"]
    let quesosDisponibles : [Int:String] = [1:"mozarela",2:"cheddar",3:"parmesano",4:"sin queso"]
    let ingredientesDisponibles : [String] = ["jamón","pepperoni","pavo","salchicha","aceituna","cebolla","pimiento","piña","anchoa","bacon","maíz","gambas","pollo","champiñones","atún"]
    
    // Operaciones con tamaños
    func tamañosParaPizza() -> [Int:String] {
        return tamañosDisponibles
    }
    
    func cambiarTamaño(indice: Int) {
        self.tamaño = tamañosDisponibles[indice]!
        self.tamañoIndice = indice
    }
    
    func verTamaño() -> String {
        return self.tamaño
    }
    
    func obtenerIndiceTamaño() -> Int{
        return self.tamañoIndice
    }

    // Operaciones con masas
    func masasParaPizza() -> [Int:String] {
        return masasDisponibles
    }
    
    func cambiarMasa(indice: Int) {
        self.masa = masasDisponibles[indice]!
        self.masaIndice = indice
    }
    
    func verMasa() -> String {
        return self.masa
    }
    
    func obtenerIndiceMasa() -> Int{
        return self.masaIndice
    }
    
    // Operaciones con quesos
    func quesosParaPizza() -> [Int:String] {
        return quesosDisponibles
    }
    
    func cambiarQueso(indice: Int) {
        self.queso = quesosDisponibles[indice]!
        self.quesoIndice = indice
    }
    
    func verQueso() -> String {
        return self.queso
    }
    
    func obtenerIndiceQueso() -> Int{
        return self.quesoIndice
    }

    
    // Operaciones con ingredientes
    func ingredientesParaPizza() -> [String] {
        return ingredientesDisponibles
    }
    
    func verIngredientes() -> [String] {
        return self.ingredientes
    }
    
    // función para saber si una pizza tiene o no un ingrediente
    func tieneIngrediente(ingrediente: String) -> Bool {
        if self.ingredientes.indexOf(ingrediente) != nil {
            return true
        }else{
            return false
        }
        
    }
    
    func añadirIngrediente(ingrediente: String) {
        self.ingredientes.append(ingrediente)
    }
    
    func quitarIngrediente(ingrediente: String) {
        if let index = self.ingredientes.indexOf(ingrediente) {
            self.ingredientes.removeAtIndex(index)
        }
    }
    
    func totalIngredientes() -> Int {
        return self.ingredientes.count
    }
    
    func activarModoEdicion(){
        self.modoEdicion = true
    }
    
    func desactivarModoEdicion(){
        self.modoEdicion = false
    }
    
    func verModoEdicion()->Bool{
        return self.modoEdicion
    }
}