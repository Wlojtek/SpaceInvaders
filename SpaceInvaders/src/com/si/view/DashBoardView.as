package com.si.view
{
	import com.si.model.IGameModel;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	public class DashBoardView extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		private static const LEVEL:String = "Level : ";
		private static const LIVES:String = "Lives : ";
		private static const SCORE:String = "Score : ";
		
		private static const SPACER:uint = 50;
		private static const DASHBOARD_HEIGHT:uint = 30;
		
		private var _gameModel:IGameModel;
		
		private var _levelLabel:TextField;
		private var _liveLabel:TextField;
		private var _scoreLabel:TextField;
		
		private var _level:TextField = new TextField();
		private var _score:TextField = new TextField();
		private var _lives:TextField = new TextField();
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function DashBoardView(gameModel:IGameModel)
		{
			super();
			
			_gameModel = gameModel;
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			gameModel.addEventListener(Event.CHANGE, gameModel_changeHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//	Private Methods
		//
		//--------------------------------------------------------------------------
		
		private function addedToStageHandler(event:Event):void
		{
			initialize();
		}
		
		private function gameModel_changeHandler(event:Event):void
		{
			updateDashBoard();
		}
		
		private function initialize():void
		{
			_level.text = LEVEL + _gameModel.getLevel();
			_score.text = SCORE + _gameModel.getScore();
			_lives.text = LIVES + _gameModel.getLives();
			
			_lives.y = stage.stageHeight - DASHBOARD_HEIGHT;
			_level.y = stage.stageHeight - DASHBOARD_HEIGHT;
			_level.x = SPACER + _lives.x;
			_score.y = stage.stageHeight - DASHBOARD_HEIGHT;
			_score.x = SPACER + _level.x; 
			
			stage.addChild(_level);
			stage.addChild(_score);
			stage.addChild(_lives);
		}
		
		//--------------------------------------------------------------------------
		//
		//	Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function updateDashBoard():void
		{
			_level.text = LEVEL + _gameModel.getLevel();
			_score.text = SCORE + _gameModel.getScore();
			_lives.text = LIVES + _gameModel.getLives();
		}
	}
}