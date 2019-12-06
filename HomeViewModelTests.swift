
import XCTest
@testable import productive

class HomeViewModelTests: XCTestCase {
    private var viewModel: HomeViewModel!

    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testEmptyScreen() {
        // If there are no habits, then I should see an empty screen message
        // Have an array of habits, if the arry is empty, then I should see a flag saying empty array? Or see a message.
        
        // Given
    }
}
