package com.si.model
{
	import com.si.events.BulletEvent;
	import com.si.model.Bullet;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class BulletsModel extends EventDispatcher implements IBulletsModel
	{
		private var _bulletsLaunched:Vector.<Bullet> = new Vector.<Bullet>;
		
		public function BulletsModel()
		{
		}
		
		public function updateBullets():void
		{
			var change:Boolean = false;
			
			for (var i:uint = 0; i <  _bulletsLaunched.length; i++)
			{
				var bullet:Bullet = _bulletsLaunched[i]; 
				bullet.fly();
				
				if (bullet.bulletMissed())
					removeBullet(bullet);
				
				change = true;
			}
			
			if (change)
				dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function addBullet(bullet:Bullet):void
		{
			_bulletsLaunched.push(bullet);
			dispatchEvent(new BulletEvent(BulletEvent.ADD_BULLET, bullet));
		}
		
		public function getBullets():Vector.<Bullet>
		{
			return _bulletsLaunched;
		}
		
		public function removeBullet(bullet:Bullet):void
		{
			var index:int = _bulletsLaunched.indexOf(bullet);
			var removedBullets:Vector.<Bullet>;
			
			if (index != -1)
				removedBullets = _bulletsLaunched.splice(index, 1);
			
			dispatchEvent(new BulletEvent(BulletEvent.REMOVE_BULLET, removedBullets[0]));
		}
		
		public function removeBullets(bullets:Vector.<Bullet>):void
		{
			
		}
	}
}