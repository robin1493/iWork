//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//
//  Copyright (c) 2016 RahulKatariya. All rights reserved.
//

import Restofire
import OAuthSwift

extension AppDelegate {

    func setupRestofire() {
        Restofire.defaultConfiguration.baseURL = "https://api.github.com/"
    }

    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if url.scheme == "com.rahulkatariya.iwork.oauth-callback" {
            OAuthSwift.handleOpenURL(url)
        }
        return true
    }
}
