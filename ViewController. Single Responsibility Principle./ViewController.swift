//
//  ViewController.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 22/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    let urlGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
    
    let urlFree = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
    
    let urlExpensive = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/10/explicit.json"
    
    // Внешние зависимости
    //var networkService = NetworkService()
    var nerworkDataFetcher = NetworkDataFetcher()
    let dataStore = DataStore()
    
    // Элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        nerworkDataFetcher.fetchExpensive(urlString: urlExpensive) { (appGroup) in
            print(appGroup?.feed.results.first?.name)
        }
        
        nerworkDataFetcher.fetchFree(urlString: urlFree) { (appGroup) in
            print(appGroup?.feed.results.first?.name)
        }
        
        nerworkDataFetcher.fetchGames(urlString: urlGames) { (appGroup) in
            print(appGroup?.feed.results.first?.name)
        }

        nerworkDataFetcher.fetchCountry(urlString: urlString) { (countries) in
            print(countries?.first?.Name)
        }
    }
    
    // MARK: - Business logic
    
    // Обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        
        dataStore.savenameInCache(name: name)
    }
    
    //MARK: - User interface
    
    // Отображение интерфейса
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Your name can't be empty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    // по которому и происходит вся работа
    // Взаимодействие пользователя с интерфейсом
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
}

