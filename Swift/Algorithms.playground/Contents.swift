import Foundation
import XCTest

// protocol Vehicle {
//   var spot: Int { get }
// }

// struct Motorcycle: Vehicle {
//   let spot = 1
// }

// struct Car: Vehicle {
//   let spot = 2
// }

// struct Van: Vehicle {
//   let spot = 3
// }

enum Vehicle2 {
    case Motorcycle
    case Car
    case Van

    var spot: Int {
        switch self {
            case .Motorcycle:
                return 1
            case .Car:
                return 2
            case .Van:
                return 3
        }
    }
}

protocol ParkingLotProtocol {
    var totalSpots: UInt { get }
    var spotsRemaining: UInt { get }
    var isFull: Bool { get }
    var isEmpty: Bool { get }

    mutating func park(vehicle: Vehicle2, completion: (Bool) -> Void)
}

struct ParkingLot: ParkingLotProtocol {
    let totalSpots: UInt
    private var vehiclesParked: [Vehicle2] = []

    init(totalSpots: UInt) {
        self.totalSpots = totalSpots
    }

    private var totalSpotsInUse: UInt {
        return UInt(vehiclesParked.map { $0.spot }.reduce(0, +))
    }

    var spotsRemaining: UInt {
        return totalSpots - totalSpotsInUse
    }

    var isFull: Bool {
        return totalSpots == totalSpotsInUse
    }

    var isEmpty: Bool {
        return totalSpotsInUse == 0
    }

    mutating func park(vehicle: Vehicle2, completion: (Bool) -> Void) {
        if spotsRemaining >= vehicle.spot {
            vehiclesParked.append(vehicle)
            completion(true)
            return
        }
        completion(false)
    }
}

// /*
// Design a parking lot using object-oriented principles
//
// Goals:
// - Your solution should be in Java - if you would like to use another language, please let the interviewer know.
// - Boilerplate is provided. Feel free to change the code as you see fit
//
// Assumptions:
// - The parking lot can hold motorcycles, cars and vans
// - The parking lot has motorcycle spots, car spots and large spots
// - A motorcycle can park in any spot
// - A car can park in a single compact spot, or a regular spot
// - A van can park, but it will take up 3 regular spots
// - These are just a few assumptions. Feel free to ask your interviewer about more assumptions as needed
//
// Here are a few methods that you should be able to run:
// - Tell us how many spots are remaining
// - Tell us how many total spots are in the parking lot
// - Tell us when the parking lot is full
// - Tell us when the parking lot is empty
// - Tell us when certain spots are full e.g. when all motorcycle spots are taken
// - Tell us how many spots vans are taking up
//
// Hey candidate! Welcome to your interview. I'll start off by giving you a Solution class. To run the code at any time, please hit the run button located in the top left corner.
// */
//
// class Solution {
//   public static void main(String[] args) {
//     ArrayList<String> strings = new ArrayList<String>();
//     strings.add("Hello, World!");
//     strings.add("Please put code below");
//     for (String string : strings) {
//       System.out.println(string);
//     }
//   }
// }
//

class ParkingLotTests: XCTestCase {
    static var allTests = {
        [("testSingle", testSingle)]
    }()

    func testZero() {
        let parking = ParkingLot(totalSpots: 0)
        XCTAssertEqual(0, parking.totalSpots)
        XCTAssertEqual(0, parking.spotsRemaining)
        XCTAssertTrue(parking.isFull)
        XCTAssertTrue(parking.isEmpty)
    }

    func testSingle() {
        let parking = ParkingLot(totalSpots: 1)
        XCTAssertEqual(1, parking.totalSpots)
        XCTAssertEqual(1, parking.spotsRemaining)
        XCTAssertFalse(parking.isFull)
        XCTAssertTrue(parking.isEmpty)
    }

    func testParkMotorcycle() {
        var parking = ParkingLot(totalSpots: 1)
        let expectation = self.expectation(description: "Should allow park when is one spot available")
        parking.park(vehicle: Vehicle2.Motorcycle) { (success: Bool) in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        XCTAssertEqual(1, parking.totalSpots)
        XCTAssertEqual(0, parking.spotsRemaining)
        XCTAssertTrue(parking.isFull)
        XCTAssertFalse(parking.isEmpty)

        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }


XCTMain([testCase(ParkingLotTests.allTests)])
}
