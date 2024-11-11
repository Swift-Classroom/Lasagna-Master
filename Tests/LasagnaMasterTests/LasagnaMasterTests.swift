import Testing
@testable import LasagnaMaster

struct LasagnaMasterTests {
    
    @Test func testRemainingMinutesExplicitTest() async throws {
        #expect(remainingMinutesInOven(elapsedMinutes: 22, expectedMinutesInOven: 100) == 78)
    }
    
    @Test func testRemainingMinutesDefaultTest() async throws {
        #expect(remainingMinutesInOven(elapsedMinutes: 22) == 18)
    }
    
    @Test func testPreparationTimeTest() async throws {
        #expect(preparationTimeInMinutes(
            layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "ricotta",
            "eggplant", "béchamel", "noodles", "sauce", "mozzarella") == 24)
    }
    
    @Test func testPreparationTimeEmptyTest() async throws {
        #expect(preparationTimeInMinutes() == 0)
    }
    
    @Test func testQuantitiesTest() async throws {
        let amount = quantities(
            layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "ricotta",
            "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
        #expect(amount.noodles == 9 && amount.sauce == 0.4 == true)
    }
    
    @Test func testQuantitiesNoSauceTest() async throws {
        let amount = quantities(
            layers: "noodles", "béchamel", "noodles", "ricotta", "eggplant", "mozzarella")
        #expect(amount.noodles == 6 && amount.sauce == 0 == true)
    }
    
    @Test func testQuantitiesNoNoodlesTest() async throws {
        let amount = quantities(
            layers: "sauce", "meat", "mozzarella", "eggplant", "béchamel", "sauce", "mozzarella")
        #expect(amount.noodles == 0 && amount.sauce == 0.4 == true)
    }
    
    @Test func testToOzTest() async throws {
        var amount = quantities(
            layers: "sauce", "noodles", "béchamel", "meat", "sauce", "noodles", "sauce", "mozzarella")
        toOz(&amount)
        #expect(amount.sauce == 20.2884)
    }
    
    @Test func testRedWineRedInequalLayerCountTest() async throws {
        #expect(redWine(layers: "sauce", "noodles", "sauce", "noodles", "meat", "noodles", "mozzarella") == true)
    }
    
    @Test func testRedWineRedEqualLayerCountTest() async throws {
        #expect(redWine(
            layers: "sauce", "noodles", "ricotta", "sauce", "noodles", "béchamel", "meat", "noodles",
            "mozzarella") == true)
    }
    
    @Test func testRedWineWhiteTest() async throws {
        #expect(redWine(
            layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "sauce", "ricotta",
            "eggplant", "mozzarella", "béchamel", "noodles", "meat", "sauce", "mozzarella") == false)
    }
    
}
