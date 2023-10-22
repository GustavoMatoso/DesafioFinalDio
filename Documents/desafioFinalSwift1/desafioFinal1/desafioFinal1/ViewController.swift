//
//  ViewController.swift
//  desafioFinal1
//
//  Created by Gustavo Matoso on 15/10/23.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Java 8", "Python 3", "Javascript", "UI/UX" , "Kotlin", "Swift", "Html e CSS", "Flutter", "Git e Github"]
    
    @IBAction func addItems(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Bootcamp to your wish list: ", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { [self] _ in
            
            let novoItem = textField.text!
            items.append(novoItem)
            tableView.reloadData()
        }
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Name:"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        
        let text = items[indexPath.row]
        cell.label.text = text
        
        
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pageTitle = items[indexPath.row]
              
                let detailsViewController = DetailsViewController()
        detailsViewController.pageTitle = pageTitle
                //detailsViewController.pageTitle = selectedCellText
                navigationController?.pushViewController(detailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80.0
        
        
    }


}

