//
//  Cask+LaunchApp.swift
//  Applite
//
//  Created by Milán Várady on 2024.12.27.
//

import Foundation

extension Cask {
    func launchApp() throws {
        let appPath: String

        if self.pkgInstaller {
            // Open PKG type app
            var applicationsDirectory = "/Applications"

            // Appdir
            if UserDefaults.standard.bool(forKey: Preferences.appdirOn.rawValue) {
                applicationsDirectory = UserDefaults.standard.string(forKey: Preferences.appdirPath.rawValue) ?? "/Applications"

                // Remove trailing "/"
                if applicationsDirectory.hasSuffix("/") {
                    applicationsDirectory.removeLast()
                }
            }

            appPath = "\"\(applicationsDirectory)/\(self.name).app\""
        } else {
            // Open normal app
            let brewDirectory = BrewPaths.currentBrewDirectory

            appPath = "\(brewDirectory.replacingOccurrences(of: " ", with: "\\ ") )/Caskroom/\(self.id)/*/*.app"
        }

        try Shell.run("open \(appPath)")
    }
}
