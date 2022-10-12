//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Aasem Hany on 30/09/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var myImageView: UIImageView!
    var selectedImage:String!
    var selectedImageIndex:Int!
    var imagesCount:Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaviagtionBar();
        myImageView.image = UIImage(named: selectedImage)
    }
    
    private func configureNaviagtionBar()  {
        title = "Image \(selectedImageIndex ?? 0) of \(imagesCount ?? 10)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onButtonTapped))
    }
    
    @objc func onButtonTapped(){
        guard let image = myImageView.image?.jpegData(compressionQuality: 0.8) else {
                print("No image found")
                return
        }
        let vc = UIActivityViewController(activityItems: [image,selectedImage ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
