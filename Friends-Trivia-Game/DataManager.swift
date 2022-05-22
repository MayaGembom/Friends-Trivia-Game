import Foundation

protocol CallBack_Data {
    func gotData(model: MyData)
}

class DataManager {
    
    var delegate: CallBack_Data?
    var data: MyData?
    
    func setData(data: MyData?){
        if let d = data {
            self.data = d
        }
    }
    
    func fetchFromServer(url: String, delegate: CallBack_Data) {
        self.delegate = delegate
        performRequest(fullUrl: url)
    }
    
    func performRequest(fullUrl: String) {
        if let url: URL = URL(string: fullUrl) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if let e = error {
                    print("error:\(e)")
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print("dataString:\(dataString!)")
                    self.parseJSON(data: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(MyData.self, from: data)
            
            DispatchQueue.main.sync {
                self.delegate?.gotData(model: model)
            }
            
        } catch {
            print("Error: \(error)")
        }
    }
}
