package com.si.view
{
	import com.si.controller.IPlayerShipController;
	import com.si.events.PlayerEvent;
	import com.si.model.IPlayerShip;
	import com.si.model.Ship;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class PlayerShipView extends ShipViewBase
	{
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		private var _playerShipController:IPlayerShipController;
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function PlayerShipView(playerShip:IPlayerShip, playerShipController:IPlayerShipController, stage:Stage)
		{
			super(playerShip.getShip());
			
			_playerShipController = playerShipController;

			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			playerShip.addEventListener(PlayerEvent.SHIP_MOVE, playerShip_moveHandler);
			
			update();
		}
		
		//--------------------------------------------------------------------------
		//
		//	Private methods
		//
		//--------------------------------------------------------------------------
		
		private function keyDownHandler(event:KeyboardEvent):void
		{
			_playerShipController.keyPressHandler(event);
		}
		
		private function playerShip_moveHandler(event:PlayerEvent):void
		{
			update();
		}
		
		//--------------------------------------------------------------------------
		//
		//	internal methods
		//
		//--------------------------------------------------------------------------
		
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