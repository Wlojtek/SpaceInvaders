package flexUnitTests
{
	
	import com.si.model.Bullet;
	
	import org.flexunit.Assert;

	public class BulletTestCase
	{	
		private var _bullet:Bullet;
		private var startPosition:uint = 10;
		
		[Before]
		public function setUp():void
		{
			_bullet = new Bullet(0, startPosition);
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
		public function testflyMissedMethod():void
		{
			_bullet.fly();
			
			Assert.assertEquals(0, _bullet.bulletSpeed);
		}
		
		[Test]
		public function testflyMethod():void
		{
			_bullet.fly();
			
			var expectedPosition:int = startPosition - Bullet.DEFAULT_SPEED
				
			Assert.assertEquals(expectedPosition, _bullet.y);
		}
	}
}