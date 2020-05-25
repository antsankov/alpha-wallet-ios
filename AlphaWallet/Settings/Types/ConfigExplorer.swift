// Copyright SIX DAY LLC. All rights reserved.

import Foundation

struct ConfigExplorer {
    private let server: RPCServer

    init(
        server: RPCServer
    ) {
        self.server = server
    }

    func transactionURL(for ID: String) -> URL? {
        guard let endpoint = explorer(for: server) else { return .none }
        let urlString: String? = {
            switch server {
            case .poa:
                return endpoint + "/txid/search/" + ID
            case .custom, .callisto:
                return .none
            default:
                return endpoint + "/tx/" + ID
            }
        }()
        guard let string = urlString else { return .none }
        return URL(string: string)!
    }

    private func explorer(for server: RPCServer) -> String? {
        switch server {
        case .main:
            return "https://etherscan.io"
        case .classic:
            return "https://gastracker.io"
        case .kovan:
            return "https://kovan.etherscan.io"
        case .ropsten:
            return "https://ropsten.etherscan.io"
        case .rinkeby:
            return "https://rinkeby.etherscan.io"
        case .poa:
            return "https://poaexplorer.com"
        case .sokol:
            return "https://sokol-explorer.poa.network"
        case .xDai:
            return "https://blockscout.com/poa/dai/"
        case .goerli:
            return "https://goerli.etherscan.io"
        case .artis_sigma1:
            return "https://explorer.sigma1.artis.network"
        case .artis_tau1:
            return "https://explorer.tau1.artis.network"
        case .custom, .callisto:
            return .none
        }
    }
    func explorerName(for server: RPCServer) -> String? {
        switch server {
        case .main, .kovan, .ropsten, .rinkeby, .goerli:
            return "Etherscan"
        case .classic:
            return "Gastracker"
        case .poa:
            return "POA Explorer"
        case .custom, .callisto:
            return nil
        case .sokol:
            return "Sokol Explorer"
        case .xDai:
            return "BlockScout"
        case .artis_sigma1:
            return "Artis"
        case .artis_tau1:
            return "ARTIS"
        }
    }
}
