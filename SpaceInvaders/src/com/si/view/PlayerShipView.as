package com.si.view
{
	import com.si.model.Ship;
	
	public class PlayerShipView extends ShipViewBase
	{
		public function PlayerShipView(ship:Ship)
		{
			super(ship);
		}
		
		override internal function drawShip():void
		{
			graphics.beginFill(uint(ship.getProperty('color')));
			
			graphics.drawRect(8, 0, 4, 5);
			graphics.drawRect(5, 5, 10, 5);
			graphics.drawRect(0, 10, 20, 5);
			
			graphics.endFill();
		}
	}
}