//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Aasem Hany on 27/09/2022.
//

import UIKit

class ViewController: UITableViewController {

    var pics = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filterPicsByNSLL(in: getLoadedPics())
        configureNaviagtionBar()
    }
    
    
    private func configureNaviagtionBar()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onButtonTapped))
    }
    
    @objc func onButtonTapped(){
        let sharedItems: [Any] = ["Hello, my friend I am recommending my app for you.", URL(string: "https://github.com/assem16399/Storm-Viewer-project-1-of-100-Days-of-swift---UIKit") ?? ""]
        let vc = UIActivityViewController(activityItems: sharedItems, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func getLoadedPics()->[String]{
        let fileManger = FileManager.default
        let path = Bundle.main.resourcePath!
        return try! fileManger.contentsOfDirectory(atPath: path)
    }
    
    func filterPicsByNSLL(in loadedPics:[String]) {
        for pic in loadedPics {
            if pic.hasPrefix("nssl") {
                self.pics.append(pic)
            }
        }
        pics.sort()
       }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "Picture",for: indexPath)
        var cellContentConfig = currentCell.defaultContentConfiguration()
        cellContentConfig.text = pics[indexPath.row]
        currentCell.contentConfiguration = cellContentConfig
        return currentCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            detailViewController.selectedImage = pics[indexPath.row]
            detailViewController.selectedImageIndex = indexPath.row + 1
            detailViewController.imagesCount = pics.count
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
   
}

