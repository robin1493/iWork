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

class GithubLoginViewController: UIViewController {

    //ViewModel
//    let viewModel = GithubLoginViewModel()

    //Properties
    @IBOutlet weak var githubLogoImageView: UIImageView!
    @IBOutlet weak var githubLoginButton: UIButton!

    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        viewModel.vc = self
//        setupViewDidLoad()
    }*/

}

///MARK: -
import OAuthSwift
import Restofire

extension GithubLoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        githubLoginButton.addTarget(self, action: #selector(loginWithGithub(_:)), forControlEvents: .TouchUpInside)
    }
    
    func loginWithGithub(sender: AnyObject?) {
        let oauthswift = OAuth2Swift(
            consumerKey:    "4520a0b3968b1c020bd6",
            consumerSecret: "039e9a6ea342beebd80848fbf30753705ac5ad08",
            authorizeUrl:   "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType:   "code"
        )
        oauthswift.authorize_url_handler = SafariURLHandler(viewController: self)
        oauthswift.authorizeWithCallbackURL(
            NSURL(string: "com.rahulkatariya.iWork.oauth-callback://github")!,
            scope: "user+repo", state:"GITHUB",
            success: { [weak self] credential, response, parameters in
                Restofire.defaultConfiguration.headers = ["Authorization": "token \(credential.oauth_token)"]
                self?.performSegueWithIdentifier("ReposSegue", sender: self)
            },
            failure: { error in
                print(error.localizedDescription)
            }
        )
    }
    
}
