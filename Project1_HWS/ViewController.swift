//
//  ViewController.swift
//  Project1_HWS
//
//  Created by Mac_Admin on 06/04/21.
//

import UIKit

class ViewController: UITableViewController {

    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var items:[String] = []
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareApp))
           items = try! fm.contentsOfDirectory(atPath: path)
            for item in items {
                if item.hasPrefix("nssl")  {
                   pictures.append(item)
                }
            }
            pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            detailVC.selectedImage = pictures[indexPath.row]
            detailVC.totalImages = pictures.count
            detailVC.selectedImageCount = indexPath.row + 1
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    @objc func shareApp() {
        let recommendationString = "Hey please check out this cool Storm Viewer app"
        let activityVC = UIActivityViewController(activityItems: [recommendationString], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityVC, animated: true, completion: nil)
    }
    
}

