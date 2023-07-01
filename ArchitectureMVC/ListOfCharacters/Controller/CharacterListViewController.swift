//
//  ViewController.swift
//  ArchitectureMVC
//
//  Created by Juan Carlos Catagña Tipantuña on 17/6/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    var mainView: CharacterListView{ self.view as! CharacterListView}
    let apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: ListOfcharactersTableviewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?

    override func loadView() {
        view = CharacterListView()
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        tableViewDataSource = ListOfcharactersTableviewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            // Present new View Controller
            guard let datasource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = datasource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailViewController, animated: true)
        }
        
        Task{
            let characters = await apiClient.getListOfCharacters()
            print("Characters: \(characters)")
            tableViewDataSource?.set(characters: characters.results)
        }
    }
    
}

