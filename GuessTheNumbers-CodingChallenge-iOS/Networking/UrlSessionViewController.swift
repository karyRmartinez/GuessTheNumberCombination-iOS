//
//  UrlSessionViewController.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 12/2/21.
//

import Foundation
import UIKit

/// My initial thought process when working with the API. Didn't work as I intended to use it at first. Had to read articles and thats how I made the other Client file.

//class UrlSessionViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let url =  "http://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new".trimmingCharacters(in: .newlines)
//        getData(from: url)
//    }
//
//    private func getData(from url: String) {
//   let task = URLSession.shared.dataTask(with: URL(string: url)!,
//     completionHandler: { data, response, error in
//        
//        guard let data = data, error == nil else {
//            print("opps")
//            return
//        }
//        
//        var result: Results?
//        do {
//            result = try JSONDecoder().decode(Results.self, from: data)
//        }
//        catch {
//            print("failed to convert in \(error.localizedDescription)")
//        }
//        guard let json = result else {
//            return
//        }
//        print(json.random)
//       // print(json)
//        
//     })
//        task.resume()
//    }
//  
//}
