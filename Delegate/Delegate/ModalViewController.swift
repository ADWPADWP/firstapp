//
//  MovieViewController.swift
//  Delegate
//
//  Created by Park Vladislav on 14.01.2023.
//

import UIKit

class ModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
UIGestureRecognizerDelegate{
    
    @IBOutlet weak var topCinstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    var categoryArray:[String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        if (categoryArray.count * 44) < Int(view.frame.height - (topCinstraint.constant + bottomConstraint.constant)) {
            let constraintValue = (view.frame.height - CGFloat(categoryArray.count * 44))/2
            topCinstraint.constant = (constraintValue)
            bottomConstraint.constant = (constraintValue)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = categoryArray[indexPath.row]
        return cell
        
        
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: tableview))! {
            return false
        }
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
