package com.si.model
{
	import flash.events.Event;

	public class Bullet
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private var _x:int;
		private var _y:int;
		
		private var _bulletSpeed:uint;
		private var _hit:Boolean = false;
		
		public static const DEFAULT_SPEED:uint= 15;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Bullet(x:int, y:int, bulletSpeed:uint=DEFAULT_SPEED)
		{
			super();
			
			_bulletSpeed = bulletSpeed;
			_x = x;
			_y = y;
			
			initialize();
		}
		
		public function get y():int
		{
			return _y;
		}

		public function get x():int
		{
			return _x;
		}

		public function get bulletSpeed():uint
		{
			return _bulletSpeed;
		}

		public function get hit():Boolean
		{
			return _hit;
		}
		
		public function set hit(value:Boolean):void
		{
			_hit = value;
		}

		private function initialize():void
		{
			//drawBullet();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		public function fly():void
		{
			_y -= _bulletSpeed;
			
			if (_y < 0)
				_bulletSpeed = 0;
		}
		
		public function bulletMissed():Boolean
		{
			return _y < 0;
		}
	
		
		/*public function removeBullet():void
		{
			stage.removeChild(this);
		}*/
	}
}