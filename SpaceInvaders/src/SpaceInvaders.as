package
{
	import com.si.controller.GameController;
	import com.si.controller.IGameController;
	import com.si.controller.IPlayerShipController;
	import com.si.controller.PlayerShipController;
	import com.si.model.BulletsModel;
	import com.si.model.Config;
	import com.si.model.GameModel;
	import com.si.model.IConfig;
	import com.si.model.IGameModel;
	import com.si.model.IPlayerShip;
	import com.si.model.IShipsModel;
	import com.si.model.InvaderShipFactory;
	import com.si.model.PlayerShip;
	import com.si.model.Ship;
	import com.si.model.ShipFactory;
	import com.si.model.ShipsModel;
	import com.si.model.SpaceCollisionsMediator;
	import com.si.view.BoardView;
	import com.si.view.DashBoardView;
	import com.si.view.PlayerShipView;
	
	import flash.display.Sprite;
	import flash.utils.Timer;
	
	public class SpaceInvaders extends Sprite
	{
		private var _bulletsModel:BulletsModel;
		private var _shipsModel:IShipsModel;
		private var _gameModel:IGameModel;
		
		private var _gameController:IGameController;
		
		private var _board:BoardView;
		private var _dashBoardView:DashBoardView;
		
		private var _spaceCollisionsMediator:SpaceCollisionsMediator;
		
		private var _playerShip:IPlayerShip;
		private var _playerShipController:IPlayerShipController;
		private var _playerShipView:PlayerShipView;
		
		public function SpaceInvaders()
		{
			var config:IConfig = new Config();
			var timer:Timer = new Timer(1000);
			
			initializeModels(config);
			initializePlayerShipController(config);
			initializeViews();
			
			addChild(_board);
			addChild(_dashBoardView);
			addChild(_playerShipView);
			
			initializeCollisionsMediator();
			
			_gameController = new GameController(_shipsModel, _bulletsModel, stage, timer, _spaceCollisionsMediator);
		}
		
		private function initializeModels(config:IConfig):void
		{
			var shipsFactory:ShipFactory = new InvaderShipFactory(config);
			
			_gameModel = new GameModel(3, 400, 400, 4, 5);
			_bulletsModel = new BulletsModel();
			_shipsModel = new ShipsModel(shipsFactory, 4, 5);
			_playerShip = new PlayerShip(_shipsModel.getPlayerShip(), config);
		}
		
		private function initializeViews():void
		{
			_dashBoardView = new DashBoardView(_gameModel);
			_board = new BoardView(_shipsModel, _bulletsModel);
			_playerShipView = new PlayerShipView(_playerShip, _playerShipController, stage);
		}
		
		private function initializePlayerShipController(config:IConfig):void
		{
			_playerShipController = new PlayerShipController(_playerShip, _bulletsModel);
		}
		
		private function initializeCollisionsMediator():void
		{
			_spaceCollisionsMediator = new SpaceCollisionsMediator();
			_spaceCollisionsMediator.registerGameModel(_gameModel);
			_spaceCollisionsMediator.registerBullets(_bulletsModel);
			_spaceCollisionsMediator.registerBulletsView(_board.getBulletsView());
			_spaceCollisionsMediator.registerShips(_shipsModel);
			_spaceCollisionsMediator.registerShipsView(_board.getShipsView());
		}
	}
}