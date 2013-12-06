package com.si.view
{
	import com.si.model.Bullet;
	
	import flash.display.Sprite;

	public class BulletView extends Sprite
	{
		private var _bullet:Bullet;
		
		public function BulletView(bullet:Bullet)
		{
			_bullet = bullet;
			
			drawBullet();
		}
		
		public function compareByBullet(bullet:Bullet):Boolean
		{
			return _bullet == bullet;
		}
		
		public function update():void
		{
			this.x = _bullet.x;
			this.y = _bullet.y;
		}
		
		public function drawBullet():void
		{
			graphics.beginFill(0x00FF04);
			
			graphics.drawRect(0, 0, 5, 5);
			graphics.drawRect(0, 5, 5, 5);
			
			graphics.endFill();
		}	
	}
}