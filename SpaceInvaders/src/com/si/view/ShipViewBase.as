package com.si.view
{
	import com.si.model.Ship;
	
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;

	public class ShipViewBase extends Sprite
	{
		protected var _ship:Ship;
		
		public function ShipViewBase(ship:Ship)
		{
			_ship = ship;	
			
			drawShip();
		}
		
		public function get ship():Ship
		{
			return _ship;
		}
		
		public function update():void
		{
			this.x = ship.x;
			this.y = ship.y;
		}

		internal function drawShip():void
		{
			throw new IllegalOperationError("Abstract method drawShip() : must be overridden in a subclass");
		}
	}
}