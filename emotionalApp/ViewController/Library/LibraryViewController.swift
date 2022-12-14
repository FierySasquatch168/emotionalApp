//
//  LibraryViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit

private enum SectionType {
    case inspiration, popular, new
}

class LibraryViewController: UIViewController {

    // порядок отображения секций по типам
    // индекс в массиве соответствует индексу секции в таблице
    private var sectionsTypesPosition: [SectionType] = [.inspiration, .popular, .new]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String?
        let articleType = sectionsTypesPosition[section]
        switch articleType {
        case .inspiration:
            title = "Inspiration"
        case .popular:
            title = "Popular"
        case .new:
            title = "New"
        }
        
        return title
    }
}
