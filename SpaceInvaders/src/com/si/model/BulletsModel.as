package com.si.model
{
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
				
				change = true;
				
				/*if (bullet.bulletMissed())
					removeBullet(bullet);*/
			}
			
			if (change)
				dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function addBullet(bullet:Bullet):void
		{
			_bulletsLaunched.push(bullet);
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function removeBullet(bullet:Bullet):void
		{
			var index:int = _bulletsLaunched.indexOf(bullet);
			
			if (index != -1)
			{
				/*if (_stage)
					_stage.removeChild(bullet);*/
				
				_bulletsLaunched.splice(index, 1);
			}
			
			dispatchEvent(new Event(Event.CHANGE));
		}
	}
}