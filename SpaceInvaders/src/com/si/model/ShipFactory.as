package com.si.model
{
	
	import flash.errors.IllegalOperationError;

	public class ShipFactory
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private var _config:IConfig;
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		public function ShipFactory(config:IConfig)
		{
			super();
			
			_config = config;
		}
		
		//--------------------------------------------------------------------------
		//
		//  public Methods
		//
		//--------------------------------------------------------------------------
		
		public function generateDefaultShip():Ship
		{
			var ship:Ship = createShip();
			ship.id = _config.getUID();
			
			return ship;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------
		
		protected function createShip():Ship
		{
			throw new IllegalOperationError("Abstract method createShip() : must be overridden in a subclass");
		}
	}
}