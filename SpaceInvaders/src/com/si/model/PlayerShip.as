package com.si.model
{
	import com.si.events.PlayerEvent;
	
	import flash.display.Stage;
	import flash.events.EventDispatcher;

	public class PlayerShip extends EventDispatcher implements IPlayerShip
	{
		private var _ship:Ship;
		
		public function PlayerShip(ship:Ship)
		{
			super();
			
			_ship = ship;
			
			initialize();
		}
		
		private function initialize():void
		{
			_ship.x = 200;
			_ship.y = 200;
			_ship.setProperty('speed', 10);
			
		}
		
		public function fire():Bullet
		{
			return new Bullet();
		}
		
		public function moveRight():void
		{
			_ship.x += uint(_ship.getProperty('speed'));
			
			dispatchEvent(new PlayerEvent(PlayerEvent.SHIP_MOVE));
		}
		
		public function moveLeft():void
		{
			_ship.x -= uint(_ship.getProperty('speed')); 
			
			dispatchEvent(new PlayerEvent(PlayerEvent.SHIP_MOVE));
		}
	}
}