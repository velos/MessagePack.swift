@testable import MessagePack
import XCTest

class FloatTests: XCTestCase {
    let packed: MessagePack.Data = [0xca, 0x40, 0x48, 0xf5, 0xc3]

    func testPack() {
        XCTAssertEqual(pack(.float(3.14)), packed)
    }

    func testUnpack() {
        let unpacked = try? unpack(packed)
        XCTAssertEqual(unpacked, MessagePackValue.float(3.14))
    }
}
