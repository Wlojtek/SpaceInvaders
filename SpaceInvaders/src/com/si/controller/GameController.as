package com.si.controller
{
	import com.si.model.Bullet;
	import com.si.model.IBulletsModel;
	import com.si.model.IShipsModel;
	import com.si.model.Model;
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
		private var _board:BoardView
		private var _timer:Timer;
		
		public function GameController(shipsModel:IShipsModel, bulletsModel:IBulletsModel, board:BoardView, timer:Timer)
		{
			_shipsModel = shipsModel;
			_bulletsModel = bulletsModel;
			_timer = timer;
			
			_board = board;
			
			initialize();
		}
		
		private function initialize():void
		{
			var gameStage:Stage = _board.getStage();
			
			_timer.addEventListener(TimerEvent.TIMER, timerEventHandler);
			gameStage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
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
		}
	}
}