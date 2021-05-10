# PaymentMethods
### Description:
`PaymentMethods` is the project implemented to display Payment Networks list. In the code base there are inline comments(where necessary) to explain the intention and behaviour of different entities.

### Git Branch:
Master branch contains most recent code base.

### Project Architecture: MVVM
### Code Desing:
SOLID principles are being followed mostly.

### Swift Version: 5.0

### Minimum iOS Version: 12.1

### API Error Handling:
API error codes are handled and they are being logged on the console.

### API Rate Limit:
Application is using an unauthenticated API to access a list of public repositories. There is certain limit imposed by Github on unauthenticaed API requests. This error has been handled and it's being logged on the console.

### Test Cases and Code coverage:
Necessary unit test cases are implemented and code coverage is also enabled to gather coverage statistics in the project.

### Project Directory Structure:
- **Manager:** It contains `NetworkManager`, `ImageDownloadManager` to perform network data requests.
- **Extension:** It contains extension to the existing type i.e `UIView`, `NSObject` etc to extend the functionality.
- **Common:** It contains common classes i.e `PMConstant`, `JSONParser` etc
- **Network:** It contains necessary classes to implement network stack.
- **Protocol:** It contains generic protocols.
- **Model:** It contains data model classes conformed to Codable protocol.
- **View:** It contains `Storyboard`, `UITableViewCell` etc
- **Controller:** Controllers in the application.
- **ViewModel:** `ViewModel` corresponding to the `ViewController`.
- **PaymentMethodsTests:** Unit test cases based on `XCTest` framework.
