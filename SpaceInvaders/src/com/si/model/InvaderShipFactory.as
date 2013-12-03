package com.si.model
{
	import com.si.model.ShipFactory;

	public class InvaderShipFactory extends ShipFactory
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		public static const SHIP_VALUE:uint = 100;
		public static const SHIP_COLOR:uint = 0x000000;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function InvaderShipFactory()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------
		
		override protected function createShip():Ship
		{
			var invaderShip:Ship = new Ship();
			invaderShip.setProperty('color', SHIP_COLOR);
			invaderShip.setProperty('value', SHIP_VALUE);
			
			return invaderShip;
		}
	}
}