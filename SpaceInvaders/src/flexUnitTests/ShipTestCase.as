package flexUnitTests
{
	import com.si.model.Ship;
	
	import org.flexunit.Assert;

	public class ShipTestCase
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testShipPropertyMethod():void
		{
			var ship:Ship = new Ship();
			ship.setProperty('testProperty', 'testValue');
			
			var property:Object = ship.getProperty('testProperty');
			Assert.assertStrictlyEquals(property, 'testValue');
		}
	}
}