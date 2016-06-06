//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//
//  Copyright (c) 2016 RahulKatariya. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {

    //ViewModel
//    let viewModel = ReposViewModel()

    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        viewModel.vc = self
//        setupViewDidLoad()
    }*/

}

///MARK: -
import Restofire
import Alamofire

extension ReposTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReposGETService().executeTask { (response: Response<[[String : AnyObject]], NSError>) in
            print(response)
        }
    }
    
    
}
