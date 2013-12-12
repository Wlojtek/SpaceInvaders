package flexUnitTests
{
	import com.si.events.BulletEvent;
	import com.si.model.Bullet;
	import com.si.model.BulletsModel;
	import com.si.model.IBulletsModel;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;

	public class BulletsModelTestCase
	{		
		private var _bulletsModel:IBulletsModel;
		private var _bullet:Bullet;
		
		[Before]
		public function setUp():void
		{
			_bullet = new Bullet(10, 10);
			_bulletsModel = new BulletsModel();
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
		public function testAddBulletMethod():void
		{
			_bulletsModel.addBullet(_bullet);
			
			var bulletsNum:uint = _bulletsModel.getBullets().length;
			
			Assert.assertEquals(1, bulletsNum);
		}
		
		[Test]
		public function testRemoveBulletMethod():void
		{
			_bulletsModel.addBullet(_bullet);
			_bulletsModel.removeBullet(_bullet);

			var bulletsNum:uint = _bulletsModel.getBullets().length;
			
			Assert.assertEquals(0, bulletsNum);
		}
		
		[Test(async, timeout=1000)]
		public function testAddBulletEvent():void 
		{
			Async.proceedOnEvent(this, _bulletsModel, BulletEvent.ADD_BULLET,
				500);
			
			_bulletsModel.addBullet(_bullet);
		}
		
		[Test(async, timeout=1000)]
		public function testRemoveBulletEvent():void 
		{
			Async.proceedOnEvent(this, _bulletsModel, BulletEvent.REMOVE_BULLET,
				500);
			
			_bulletsModel.addBullet(_bullet);
			_bulletsModel.removeBullet(_bullet);
		}
	}
}