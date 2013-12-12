package com.si.controller
{
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
		private var _timer:Timer;
		private var _collisionMediator:ICollisionMediator;
		
		public function GameController(shipsModel:IShipsModel, bulletsModel:IBulletsModel, stage:Stage, timer:Timer, collisionMediator:ICollisionMediator)
		{
			_shipsModel = shipsModel;
			_bulletsModel = bulletsModel;
			
			_timer = timer;
			
			_stage = stage;
			_collisionMediator = collisionMediator;
			
			initialize();
		}
		
		private function initialize():void
		{
			_timer.addEventListener(TimerEvent.TIMER, timerEventHandler);
			_stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			_timer.start();
		}
		
		public function startGame():void
		{
		
		}
		
		private function timerEventHandler(event:TimerEvent):void
		{
			_shipsModel.moveShips();
		}
		
		private function enterFrameHandler(event:Event):void
		{
			_bulletsModel.updateBullets();
			_collisionMediator.checkCollisions();
		}
	}
}