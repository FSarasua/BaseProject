//
//  Constants.swift
//  BaseProject
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation

/* Buenas prácticas: Para hacer referencia a las constantes se escribirá al principio 'K', para que no entre en conflicto con otras posibles clases */

public struct KService {
    
}

public struct KEndPoint {
    
}

public struct KBundle {
    public static let baseProject = Bundle(identifier: "org.cocoapods.BaseProject")
}

public struct KClassName {
    public static let baseStandard = String(describing: BaseStandardViewController.self)
    public static let baseStandardTable = String(describing: BaseStandardTableViewController.self)
}

public struct KCellID {
    public static let baseCell = "BaseTableViewCell"
    public static let mainCell = "MainTableViewCell"
    public static let labelCell = "LabelTableViewCell"
    public static let imageCell = "ImageTableViewCell"
    public static let imageLabelCell = "ImageLabelTableViewCell"
}

public struct KSystemImageName {
    public static let trash = "trash"
    public static let paperplane = "paperplane"
}

public struct TestText {
    public static let loremIpsum1 = """
    Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.
    """
    public static let loremIpsum2 = """
    Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500.
    """
    public static let loremIpsum3 = """
    Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.
    """
    public static let loremIpsum4 = """
    Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original.
    """
}

public struct TextDescription {
    public static let baseStandard = """
    Pantalla Base de un UIViewController en el nivel más básico de este proyecto. Contiene la arquitectura VIPER ya enlazada, un ViewModel y un UIActivityViewController, a modo de carga de pantalla antes de mostrar los datos reales a presentar.
    """
    public static let baseStandardTable = """
Pantalla Base de un UITableViewController en el nivel más básico de este proyecto. Contiene la arquitectura VIPER ya enlazada, un ViewModel con modelo de datos para UITableView con 1 sección, UITableViewCell maquetadas a nivel básico y con modelo de datos preparado y, por último, un UIActivityViewController, a modo de carga de pantalla antes de mostrar los datos reales a presentar, tras la carga del UITableView. A modo de testing se añadió una congelación para simular la carga de datos mientras se visualiza la animación del loader.
"""
}
