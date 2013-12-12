package com.si.controller
{
	import com.si.model.Bullet;
	import com.si.model.BulletsModel;
	import com.si.model.IBulletsModel;
	import com.si.model.IPlayerShip;
	import com.si.model.PlayerShip;
	import com.si.model.Ship;
	import com.si.view.PlayerShipView;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class PlayerShipController implements IPlayerShipController
	{
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		public static const LEFT_MOVE:uint = 37; 
		public static const RIGHT_MOVE:uint = 39; 
		public static const SHOOT:uint = 32; 
		
		private var _playerShip:IPlayerShip;
		private var _bullletsModel:IBulletsModel
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function PlayerShipController(playerShip:IPlayerShip, bulletsModel:IBulletsModel)
		{
			_playerShip = playerShip;
			_bullletsModel = bulletsModel;
			
			initialize();
		}
	
		//--------------------------------------------------------------------------
		//
		//	Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function moveShipLeft():void
		{
			_playerShip.moveLeft();
		}
		
		public function moveShipRight():void
		{
			_playerShip.moveRight();
		}
		
		public function shoot():void
		{
			_playerShip.fire();
		}
		
		public function keyPressHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == LEFT_MOVE)
				moveShipLeft();
			else if (event.keyCode == RIGHT_MOVE)
				moveShipRight();
			else if(event.keyCode == SHOOT)
			{
				var bullet:Bullet = _playerShip.fire();
				_bullletsModel.addBullet(bullet);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//	Private Methods
		//
		//--------------------------------------------------------------------------
		
		private function initialize():void
		{
		}
		
		private function playerShipMoveLeft(event:Event):void
		{
			moveShipLeft();
		}
		
		private function playerShipMoveRight(event:Event):void
		{
			moveShipRight();
		}
	}
}