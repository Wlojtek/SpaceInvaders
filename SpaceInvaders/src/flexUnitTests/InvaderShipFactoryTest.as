package flexUnitTests
{
	
	import com.si.model.Config;
	import com.si.model.InvaderShipFactory;
	import com.si.model.Ship;
	import com.si.model.ShipFactory;
	
	import org.flexunit.Assert;

	public class InvaderShipFactoryTest
	{		
		private var invaderShip:Ship;
		
		[Before]
		public function setUp():void
		{
			var invaderFactory:ShipFactory = new InvaderShipFactory(new Config());
			invaderShip = invaderFactory.generateDefaultShip();
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
		public function testGenerateDefaultShippMethod():void
		{
			Assert.assertNotNull(invaderShip);
			Assert.assertStrictlyEquals(InvaderShipFactory.SHIP_VALUE, invaderShip.getProperty('value'));
			Assert.assertStrictlyEquals(InvaderShipFactory.SHIP_COLOR, invaderShip.getProperty('color'));
		}
	}
}