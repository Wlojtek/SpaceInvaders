package com.si.view
{
	import com.si.model.Ship;

	public class InvaderShipView extends ShipViewBase
	{
		public function InvaderShipView(ship:Ship)
		{
			super(ship);
		}
		
		override internal function drawShip():void
		{
			graphics.beginFill(uint(ship.getProperty('color')));
			
			graphics.drawRect(0, 0, 20, 5);
			graphics.drawRect(5, 5, 10, 5);
			graphics.drawRect(8, 10, 4, 5);
			
			graphics.endFill();
		}
	}
}