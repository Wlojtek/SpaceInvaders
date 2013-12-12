package flexUnitTests
{
	import com.si.events.ShipEvent;
	import com.si.model.Config;
	import com.si.model.IShipsModel;
	import com.si.model.InvaderShipFactory;
	import com.si.model.Ship;
	import com.si.model.ShipFactory;
	import com.si.model.ShipsModel;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;

	public class ShipsModelTestCase
	{		
		private var _shipsModel:IShipsModel;
		private var _ship:Ship;
		
		[Before]
		public function setUp():void
		{
			var shipsFactory:ShipFactory = new InvaderShipFactory(new Config());
			
			_shipsModel = new ShipsModel(shipsFactory, 0, 0);
			_ship = new Ship();
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
		public function testAddShipMethod():void
		{
			_shipsModel.addShip(_ship);
			
			var hasAnyShip:Boolean = _shipsModel.haveAnyShips();
			
			Assert.assertTrue(hasAnyShip);
		}
		
		[Test]
		public function testRemoveShipMethod():void
		{
			_shipsModel.addShip(_ship);
			_shipsModel.removeShip(_ship);
			
			var hasAnyShip:Boolean = _shipsModel.haveAnyShips();
			
			Assert.assertFalse(hasAnyShip);
		}
		
		[Test]
		public function testMoveShips():void
		{
			var expectedPositionX:uint = ShipsModel.SHIPS_SPEED;
			
			_shipsModel.addShip(_ship);
			_shipsModel.moveShips();
			
			var ships:Vector.<Vector.<Ship>> = _shipsModel.getShips();
			
			Assert.assertEquals(expectedPositionX, ships[0][0].x);
		}
		
		[Test(async, timeout=1000)]
		public function testRemoveShipEvent():void 
		{
			Async.proceedOnEvent(this, _shipsModel, ShipEvent.REMOVE_SHIP,
				500);
			
			_shipsModel.addShip(_ship);
			_shipsModel.removeShip(_ship);
		}
	}
}