//
//  SettingsView+ProxySettings.swift
//  Applite
//
//  Created by Milán Várady on 2024.12.26.
//

import SwiftUI

extension SettingsView {
    struct ProxySettingsView: View {
        @AppStorage(Preferences.networkProxyEnabled.rawValue) var proxyEnabled: Bool = true
        @AppStorage(Preferences.preferredProxyType.rawValue) var preferredProxyType: NetworkProxyType = .http

        var body: some View {
            VStack(alignment: .center) {
                Toggle("Use system proxy", isOn: $proxyEnabled)

                Picker("Preferred proxy protocol", selection: $preferredProxyType) {
                    ForEach(NetworkProxyType.allCases, id: \.self) { proxyType in
                        Text(proxyType.displayName)
                            .tag(proxyType.rawValue)
                    }
                }
                .padding(.bottom)

                Text("\(Bundle.main.appName) uses the system network proxy, but it can only use one protocol (HTTP, HTTPS, or SOCKS5). Select your preferred method.")
                    .font(.system(.body, weight: .light))
                    .frame(minHeight: 60)
            }
            .padding()
        }
    }
}
