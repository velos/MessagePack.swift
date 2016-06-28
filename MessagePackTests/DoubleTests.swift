@testable import MessagePack
import XCTest

class DoubleTests: XCTestCase {
    func testLiteralConversion() {
        let implicitValue: MessagePackValue = 3.14
        XCTAssertEqual(implicitValue, MessagePackValue.double(3.14))
    }

    let packed: MessagePack.Data = [0xcb, 0x40, 0x09, 0x1e, 0xb8, 0x51, 0xeb, 0x85, 0x1f]

    func testPack() {
        XCTAssertEqual(pack(.double(3.14)), packed)
    }

    func testUnpack() {
        let unpacked = try? unpack(packed)
        XCTAssertEqual(unpacked, MessagePackValue.double(3.14))
    }
}
