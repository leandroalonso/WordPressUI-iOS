import XCTest

@testable import WordPressUI

class UIViewGhostTests: XCTestCase {
    func testAddGhostLayer() {
        let view = UIView()

        view.startGhostAnimation()

        XCTAssertNotNil(view.layer.sublayers?.first(where: { $0 is GhostLayer }))
    }

    func testDoNotAddGhostLayer() {
        let view = UIView()
        view.isGhostable = false

        view.startGhostAnimation()

        XCTAssertNil(view.layer.sublayers?.first(where: { $0 is GhostLayer }))
    }

    func testDoNotAddGhostLayerInSubviews() {
        let subview = UIView()
        let view = UIView()
        view.addSubview(subview)
        view.isGhostable = false

        view.startGhostAnimation()

        XCTAssertNil(subview.layer.sublayers?.first(where: { $0 is GhostLayer }))
    }
}
