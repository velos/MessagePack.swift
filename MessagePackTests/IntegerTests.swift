@testable import MessagePack
import XCTest

class IntegerTests: XCTestCase {
    func testPosLiteralConversion() {
        let implicitValue: MessagePackValue = -1
        XCTAssertEqual(implicitValue, MessagePackValue.int(-1))
    }

    func testNegLiteralConversion() {
        let implicitValue: MessagePackValue = 42
        XCTAssertEqual(implicitValue, MessagePackValue.uInt(42))
    }

    func testPackNegFixint() {
        XCTAssertEqual(pack(.int(-1)), [0xff])
    }

    func testUnpackNegFixint() {
        let unpacked1 = try? unpack([0xff])
        XCTAssertEqual(unpacked1, MessagePackValue.int(-1))

        let unpacked2 = try? unpack([0xe0])
        XCTAssertEqual(unpacked2, MessagePackValue.int(-32))
    }

    func testPackPosFixintSigned() {
        XCTAssertEqual(pack(.int(1)), [0x01])
    }

    func testUnpackPosFixintSigned() {
        let unpacked = try? unpack([0x01])
        XCTAssertEqual(unpacked, MessagePackValue.int(1))
    }

    func testPackPosFixintUnsigned() {
        XCTAssertEqual(pack(.uInt(42)), [0x2a])
    }

    func testUnpackPosFixintUnsigned() {
        let unpacked = try? unpack([0x2a])
        XCTAssertEqual(unpacked, MessagePackValue.uInt(42))
    }

    func testPackUInt8() {
        XCTAssertEqual(pack(.uInt(0xff)), [0xcc, 0xff])
    }

    func testUnpackUInt8() {
        let unpacked = try? unpack([0xcc, 0xff])
        XCTAssertEqual(unpacked, MessagePackValue.uInt(0xff))
    }

    func testPackUInt16() {
        XCTAssertEqual(pack(.uInt(0xffff)), [0xcd, 0xff, 0xff])
    }

    func testUnpackUInt16() {
        let unpacked = try? unpack([0xcd, 0xff, 0xff])
        XCTAssertEqual(unpacked, MessagePackValue.uInt(0xffff))
    }

    func testPackUInt32() {
        XCTAssertEqual(pack(.uInt(0xffff_ffff)), [0xce, 0xff, 0xff, 0xff, 0xff])
    }

    func testUnpackUInt32() {
        let unpacked = try? unpack([0xce, 0xff, 0xff, 0xff, 0xff])
        XCTAssertEqual(unpacked, MessagePackValue.uInt(0xffff_ffff))
    }

    func testPackUInt64() {
        XCTAssertEqual(pack(.uInt(0xffff_ffff_ffff_ffff)), [0xcf, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff])
    }

    func testUnpackUInt64() {
        let unpacked = try? unpack([0xcf, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff])
        XCTAssertEqual(unpacked, MessagePackValue.uInt(0xffff_ffff_ffff_ffff))
    }

    func testPackInt8() {
        XCTAssertEqual(pack(.int(-0x7f)), [0xd0, 0x81])
    }

    func testUnpackInt8() {
        let unpacked = try? unpack([0xd0, 0x81])
        XCTAssertEqual(unpacked, MessagePackValue.int(-0x7f))
    }

    func testPackInt16() {
        XCTAssertEqual(pack(.int(-0x7fff)), [0xd1, 0x80, 0x01])
    }

    func testUnpackInt16() {
        let unpacked = try? unpack([0xd1, 0x80, 0x01])
        XCTAssertEqual(unpacked, MessagePackValue.int(-0x7fff))
    }

    func testPackInt32() {
        XCTAssertEqual(pack(.int(-0x1_0000)), [0xd2, 0xff, 0xff, 0x00, 0x00])
    }

    func testUnpackInt32() {
        let unpacked = try? unpack([0xd2, 0xff, 0xff, 0x00, 0x00])
        XCTAssertEqual(unpacked, MessagePackValue.int(-0x1_0000))
    }

    func testPackInt64() {
        XCTAssertEqual(pack(.int(-0x1_0000_0000)), [0xd3, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00])
    }

    func testUnpackInt64() {
        let unpacked = try? unpack([0xd3, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00])
        XCTAssertEqual(unpacked, MessagePackValue.int(-0x1_0000_0000))
    }

    func testUnpackInsufficientData() {
        let dataArray: [MessagePack.Data] = [[0xd0], [0xd1], [0xd2], [0xd3], [0xd4]]
        for data in dataArray {
            do {
                try _ = unpack(data)
                XCTFail("Expected unpack to throw")
            } catch {
                XCTAssertEqual(error as? MessagePackError, .insufficientData)
            }
        }
    }
}
