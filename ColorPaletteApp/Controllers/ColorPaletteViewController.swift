//
//  ViewController.swift
//  ColorPaletteApp
//
//  Created by Sunni Tang on 8/20/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

/*
 Make a color palette app
 Start with 5 colors (can add or remove later)
 Where each cell in a tableview segues into a new VC where you can use 4 sliders to adjust the RGB and alpha values
sliders can be in a stack view
 
 We need:
 - 2 view controllers (table view, one sliders)
 - colorChangeable protocol model
 - color struct (with RGBa values)
 */


import UIKit

class ColorPaletteViewController: UIViewController {

    @IBOutlet weak var colorPaletteTableView: UITableView!
    
    var currentColors = ColorsData.initialColors
    
    var currentColor: UIColor?
    
    var tracker: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorPaletteTableView.dataSource = self
        colorPaletteTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        if let currentColor = currentColor{
            currentColors[tracker] = currentColor
        }
        colorPaletteTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "cellToSettingsSegue" else { fatalError() }
        guard let indexPath = colorPaletteTableView.indexPathForSelectedRow else { fatalError() }
        guard let settingsVC = segue.destination as? SettingsViewController else { fatalError() }
     
        settingsVC.initialChosenColor = currentColors[indexPath.row]
        
        tracker = indexPath.row

        settingsVC.delegate = self
        
    }
    
}

extension ColorPaletteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = currentColors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.contentView.backgroundColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


extension ColorPaletteViewController: ColorChangeable {
    func changeColor(to newColor: UIColor) {
        currentColor = newColor
    }
    
}
