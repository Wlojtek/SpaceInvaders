package com.si.model
{
	
	import flash.errors.IllegalOperationError;

	public class ShipFactory
	{
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		public function ShipFactory()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  public Methods
		//
		//--------------------------------------------------------------------------
		
		public function generateDefaultShip():Ship
		{
			var ship:Ship = createShip();
			
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