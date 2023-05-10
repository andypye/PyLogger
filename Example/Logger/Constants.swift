//
//  Constants.swift
//  PyLogger_Example
//
//  Created by Andy Pye on 10/05/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

struct Constants {
    
}


extension Constants {
    
    struct App {
        static var isDebugBuild: Bool {
#if DEBUG
            return true
#else
            return false
#endif
        }
        
        static var isTestBuild: Bool {
            guard let path = Bundle.main.appStoreReceiptURL?.path else { return false }
            return path.contains("CoreSimulator") || path.contains("sandboxReceipt")
        }
    }
}
