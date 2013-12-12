package com.si.controller
{
	import com.si.events.ShipEvent;
	import com.si.model.Bullet;
	import com.si.model.GameModel;
	import com.si.model.IBulletsModel;
	import com.si.model.ICollisionMediator;
	import com.si.model.IGameModel;
	import com.si.model.IShipsModel;
	import com.si.model.Ship;
	import com.si.view.BoardView;
	import com.si.view.ShipViewBase;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class GameController implements IGameController
	{
		private var _shipsModel:IShipsModel;
		private var _bulletsModel:IBulletsModel;
		private var _gameModel:IGameModel;
		
		private var _stage:Stage
		private var _shipsTimer:Timer;
		private var _collisionMediator:ICollisionMediator;
		
		public function GameController(shipsModel:IShipsModel, bulletsModel:IBulletsModel, stage:Stage, shipsTimer:Timer, collisionMediator:ICollisionMediator)
		{
			_shipsModel = shipsModel;
			_bulletsModel = bulletsModel;
			_shipsTimer = shipsTimer;
			
			_stage = stage;
			_collisionMediator = collisionMediator;
			
			initialize();
		}
		
		private function initialize():void
		{
			_shipsTimer.addEventListener(TimerEvent.TIMER, timerEventHandler);
			_stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			_shipsModel.addEventListener(ShipEvent.SHIP_HIT_BOTTOM, _shipsModel_shipHitBottomHandler);
			_shipsModel.addEventListener(ShipEvent.REMOVE_SHIP, _shipsModel_shipRemoveHandler);
			
			_shipsTimer.start();
		}
		
		public function startGame():void
		{
		
		}
		
		private function enterFrameHandler(event:Event):void
		{
			_bulletsModel.updateBullets();
			_collisionMediator.checkCollisions();
		}
		
		private function _shipsModel_shipRemoveHandler(event:ShipEvent):void
		{
			if (!_shipsModel.haveAnyShips())
			{
				_shipsTimer.stop();
			}
		}
		
		private function _shipsModel_shipHitBottomHandler(event:ShipEvent):void
		{
			_shipsTimer.stop();
		}
		
		private function timerEventHandler(event:TimerEvent):void
		{
			_shipsModel.moveShips();
		}
	}
}