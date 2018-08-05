import Foundation


for i in 1...10000000 {

let jsonString = "{ \"foo\": 1, \"bar\": [10, \"apples\"] }"
if let jsonData = jsonString.data(using: .utf8) {
	if let jsonObject: Any = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) {

	}
}

}
