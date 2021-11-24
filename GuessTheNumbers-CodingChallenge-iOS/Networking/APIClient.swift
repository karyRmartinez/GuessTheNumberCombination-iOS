//
//  APIClient.swift
//  GuessTheNumbers-CodingChallenge-iOS
//
//  Created by Kary Martinez on 11/23/21.
//

import Foundation

struct APIClient {
    func fetchData(completion: @escaping (Result<[numbers], Error>) -> ()) {
        
        let endpointURLString = "http://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new"
        
        guard let url = URL(string: endpointURLString) else {
            print("bad url")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("bad status code")
                return
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    let nums = try JSONDecoder().decode(Results.self, from: jsonData)
                    //   completion(.success(nums.random))
                } catch {
                    // decoding error
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
