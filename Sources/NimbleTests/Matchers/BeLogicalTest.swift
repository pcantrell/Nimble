import XCTest
import Nimble

enum ConvertsToBool : BooleanType, CustomStringConvertible {
    case TrueLike, FalseLike

    var boolValue : Bool {
        switch self {
        case .TrueLike: return true
        case .FalseLike: return false
        }
    }

    var description : String {
        switch self {
        case .TrueLike: return "TrueLike"
        case .FalseLike: return "FalseLike"
        }
    }
}

class BeTruthyTest : XCTestCase, XCTestCaseProvider {
    var allTests: [(String, () -> Void)] {
        return [
            ("testShouldMatchNonNilTypes", testShouldMatchNonNilTypes),
            ("testShouldMatchTrue", testShouldMatchTrue),
            ("testShouldNotMatchNilTypes", testShouldNotMatchNilTypes),
            ("testShouldNotMatchFalse", testShouldNotMatchFalse),
            ("testShouldNotMatchNilBools", testShouldNotMatchNilBools),
            ("testShouldMatchBoolConvertibleTypesThatConvertToTrue", testShouldMatchBoolConvertibleTypesThatConvertToTrue),
            ("testShouldNotMatchBoolConvertibleTypesThatConvertToFalse", testShouldNotMatchBoolConvertibleTypesThatConvertToFalse),
        ]
    }

    func testShouldMatchNonNilTypes() {
        expect(true as Bool?).to(beTruthy())
        expect(1 as Int?).to(beTruthy())
    }

    func testShouldMatchTrue() {
        expect(true).to(beTruthy())

        failsWithErrorMessage("expected to not be truthy, got <true>") {
            expect(true).toNot(beTruthy())
        }
    }

    func testShouldNotMatchNilTypes() {
        expect(false as Bool?).toNot(beTruthy())
        expect(nil as Bool?).toNot(beTruthy())
        expect(nil as Int?).toNot(beTruthy())
    }

    func testShouldNotMatchFalse() {
        expect(false).toNot(beTruthy())

        failsWithErrorMessage("expected to be truthy, got <false>") {
            expect(false).to(beTruthy())
        }
    }

    func testShouldNotMatchNilBools() {
        expect(nil as Bool?).toNot(beTruthy())

        failsWithErrorMessage("expected to be truthy, got <nil>") {
            expect(nil as Bool?).to(beTruthy())
        }
    }

    func testShouldMatchBoolConvertibleTypesThatConvertToTrue() {
        expect(ConvertsToBool.TrueLike).to(beTruthy())

        failsWithErrorMessage("expected to not be truthy, got <TrueLike>") {
            expect(ConvertsToBool.TrueLike).toNot(beTruthy())
        }
    }

    func testShouldNotMatchBoolConvertibleTypesThatConvertToFalse() {
        expect(ConvertsToBool.FalseLike).toNot(beTruthy())

        failsWithErrorMessage("expected to be truthy, got <FalseLike>") {
            expect(ConvertsToBool.FalseLike).to(beTruthy())
        }
    }
}

class BeTrueTest : XCTestCase, XCTestCaseProvider {
    var allTests: [(String, () -> Void)] {
        return [
            ("testShouldMatchTrue", testShouldMatchTrue),
            ("testShouldNotMatchFalse", testShouldNotMatchFalse),
            ("testShouldNotMatchNilBools", testShouldNotMatchNilBools),
        ]
    }

    func testShouldMatchTrue() {
        expect(true).to(beTrue())

        failsWithErrorMessage("expected to not be true, got <true>") {
            expect(true).toNot(beTrue())
        }
    }

    func testShouldNotMatchFalse() {
        expect(false).toNot(beTrue())

        failsWithErrorMessage("expected to be true, got <false>") {
            expect(false).to(beTrue())
        }
    }

    func testShouldNotMatchNilBools() {
        failsWithErrorMessageForNil("expected to not be true, got <nil>") {
            expect(nil as Bool?).toNot(beTrue())
        }

        failsWithErrorMessageForNil("expected to be true, got <nil>") {
            expect(nil as Bool?).to(beTrue())
        }
    }
}

class BeFalsyTest : XCTestCase, XCTestCaseProvider {
    var allTests: [(String, () -> Void)] {
        return [
            ("testShouldMatchNilTypes", testShouldMatchNilTypes),
            ("testShouldNotMatchTrue", testShouldNotMatchTrue),
            ("testShouldNotMatchNonNilTypes", testShouldNotMatchNonNilTypes),
            ("testShouldMatchFalse", testShouldMatchFalse),
            ("testShouldMatchNilBools", testShouldMatchNilBools),
        ]
    }

    func testShouldMatchNilTypes() {
        expect(false as Bool?).to(beFalsy())
        expect(nil as Bool?).to(beFalsy())
        expect(nil as Int?).to(beFalsy())
    }

    func testShouldNotMatchTrue() {
        expect(true).toNot(beFalsy())

        failsWithErrorMessage("expected to be falsy, got <true>") {
            expect(true).to(beFalsy())
        }
    }

    func testShouldNotMatchNonNilTypes() {
        expect(true as Bool?).toNot(beFalsy())
        expect(1 as Int?).toNot(beFalsy())
    }

    func testShouldMatchFalse() {
        expect(false).to(beFalsy())

        failsWithErrorMessage("expected to not be falsy, got <false>") {
            expect(false).toNot(beFalsy())
        }
    }

    func testShouldMatchNilBools() {
        expect(nil as Bool?).to(beFalsy())

        failsWithErrorMessage("expected to not be falsy, got <nil>") {
            expect(nil as Bool?).toNot(beFalsy())
        }
    }
}

class BeFalseTest : XCTestCase, XCTestCaseProvider {
    var allTests: [(String, () -> Void)] {
        return [
            ("testShouldNotMatchTrue", testShouldNotMatchTrue),
            ("testShouldMatchFalse", testShouldMatchFalse),
            ("testShouldNotMatchNilBools", testShouldNotMatchNilBools),
        ]
    }

    func testShouldNotMatchTrue() {
        expect(true).toNot(beFalse())

        failsWithErrorMessage("expected to be false, got <true>") {
            expect(true).to(beFalse())
        }
    }

    func testShouldMatchFalse() {
        expect(false).to(beFalse())

        failsWithErrorMessage("expected to not be false, got <false>") {
            expect(false).toNot(beFalse())
        }
    }

    func testShouldNotMatchNilBools() {
        failsWithErrorMessageForNil("expected to be false, got <nil>") {
            expect(nil as Bool?).to(beFalse())
        }

        failsWithErrorMessageForNil("expected to not be false, got <nil>") {
            expect(nil as Bool?).toNot(beFalse())
        }
    }
}
