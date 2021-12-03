# GuessTheNumberCombination-iOS
LinkedIn coding challenge.

## Description 

//

## ScreenShot

// ![home Screen](Assets/homescreen.png)

## Gif
! [Guess The Number App] (Assets/)

## Code snippet of a challenging part of app

```swift
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
    ```
