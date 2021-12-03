//
//  APIClient.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/23/21.
//

import Foundation

enum RandomAPI { }

extension RandomAPI {
    struct get {
        let result: (()-> String?)
        init(total: Int, min: Int, max: Int){
            let url = "https://www.random.org/integers/?num=\(total)&min=\(min)&max=\(max)&col=1&base=10&format=plain&rnd=new"
            result = {
                do {
                    let data = try Data(contentsOf: URL(string: url)!)
                    let result = String(data: data, encoding: .utf8)!.components(separatedBy: "\n").joined()
                    return result
                } catch {
                    return nil
                }
            }
        }
    }
}



