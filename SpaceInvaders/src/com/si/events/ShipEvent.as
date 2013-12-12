package com.si.events
{
	import com.si.model.Ship;
	
	import flash.events.Event;
	
	public class ShipEvent extends Event
	{
		public static const ADD_SHIP:String = "addShip";
		public static const REMOVE_SHIP:String = "removeShip";
		public static const SHIP_HIT_BOTTOM:String = "shipHitBottom";
		
		private var _ship:Ship;
		
		public function ShipEvent(type:String, ship:Ship, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_ship = ship;
		}

		public function get ship():Ship
		{
			return _ship;
		}
	}
}