package com.si.model
{
	import com.si.events.PlayerEvent;
	
	import flash.display.Stage;
	import flash.events.EventDispatcher;

	public class PlayerShip extends EventDispatcher implements IPlayerShip
	{
		private var _ship:Ship;
		private var _config:IConfig;
		
		public function PlayerShip(ship:Ship, config:IConfig)
		{
			super();
			
			_ship = ship;
			_config = config;
			
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
			var bullet:Bullet = new Bullet(_ship.x, _ship.y);
			bullet.id = _config.getUID();
			
			return bullet;
		}
		
		public function getShip():Ship
		{
			return _ship;
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