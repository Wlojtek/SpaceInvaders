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
		public static const LEFT_MOVE:uint = 37; 
		public static const RIGHT_MOVE:uint = 39; 
		public static const SHOOT:uint = 32; 
		
		private var _playerShip:IPlayerShip;
		private var _stage:Stage;
		private var _bullletsModel:IBulletsModel
		
		public function PlayerShipController(playerShip:IPlayerShip, bulletsModel:IBulletsModel, stage:Stage)
		{
			_playerShip = playerShip;
			_stage = stage;
			_bullletsModel = bulletsModel;
			
			initialize();
		}
		
		private function initialize():void
		{
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			_stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
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
		
		private function keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == LEFT_MOVE)
			{
				moveShipLeft();
				/*_playerShip.addEventListener(Event.ENTER_FRAME, playerShipMoveLeft);*/
			}
			else if (event.keyCode == RIGHT_MOVE)
			{
				moveShipRight();
				/*_playerShip.addEventListener(Event.ENTER_FRAME, playerShipMoveRight);*/
			}
			else if(event.keyCode == SHOOT)
			{
				var bullet:Bullet = _playerShip.fire();
				_bullletsModel.addBullet(bullet);
			}
		}
		
		private function keyUpHandler(event:KeyboardEvent):void
		{
			/*if (event.keyCode == LEFT_MOVE) 
				_playerShip.removeEventListener(Event.ENTER_FRAME, playerShipMoveLeft);
			else if (event.keyCode == RIGHT_MOVE) 
				_playerShip.removeEventListener(Event.ENTER_FRAME, playerShipMoveRight);*/
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