package com.si.events
{
	import com.si.model.Bullet;
	
	import flash.events.Event;
	
	public class BulletEvent extends Event
	{
		public static const ADD_BULLET:String = "addBullet";
		public static const REMOVE_BULLET:String = "removeBullet";
		
		private var _bullet:Bullet;
		
		public function BulletEvent(type:String, bullet:Bullet, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_bullet = bullet;
		}
		
		public function get bullet():Bullet
		{
			return _bullet;
		}
	}
}