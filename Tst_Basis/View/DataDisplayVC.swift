//
//  ViewController.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 09/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import UIKit
import iCarousel

class DataDisplayVC: UIViewController {

    @IBOutlet weak var displayTextCarousel: iCarousel!
    
    var indicator = UIActivityIndicatorView()
    
    let dataSource = TextDataSource()
    lazy var viewModel:TextViewModel = {
        let viewModel = TextViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Basis"
        
        activityIndicator()
        
        self.displayTextCarousel.type = iCarouselType.rotary
        self.displayTextCarousel.isVertical = false
        self.displayTextCarousel.dataSource = self.dataSource

        self.indicator.startAnimating()

        self.setDataModel()
    }
    
    func setDataModel()  {
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.displayTextCarousel.reloadData()
            self?.indicator.stopAnimating()
            self?.indicator.hidesWhenStopped = true
        }
        
        // add error handling example
        self.viewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
            self?.indicator.stopAnimating()
            self?.indicator.hidesWhenStopped = true
        }
        
        self.viewModel.fetchDataValues()
    }

    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.backgroundColor = .gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
}

