package com.si.model
{
	public class PlayerShipFactory extends ShipFactory
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		public static const SHIP_SPEED:uint = 10;
		public static const SHIP_COLOR:uint = 0x000000;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function PlayerShipFactory(config:IConfig)
		{
			super(config);
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
			invaderShip.setProperty('speed', SHIP_SPEED);
			
			return invaderShip;
		}
	}
}