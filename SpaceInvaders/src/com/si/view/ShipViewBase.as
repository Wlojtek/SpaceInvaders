package com.si.view
{
	import com.si.model.Ship;
	
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;

	public class ShipViewBase extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		protected var _ship:Ship;
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function ShipViewBase(ship:Ship)
		{
			_ship = ship;	
			
			drawShip();
		}
		
		//--------------------------------------------------------------------------
		//
		//	Public methods
		//
		//--------------------------------------------------------------------------
		
		public function get ship():Ship
		{
			return _ship;
		}
		
		public function compareByShip(ship:Ship):Boolean
		{
			return _ship.id == ship.id;
		}
		
		public function update():void
		{
			this.x = ship.x;
			this.y = ship.y;
		}

		//--------------------------------------------------------------------------
		//
		//	internal methods
		//
		//--------------------------------------------------------------------------
		
		internal function drawShip():void
		{
			throw new IllegalOperationError("Abstract method drawShip() : must be overridden in a subclass");
		}
	}
}