package
{
	import com.si.controller.GameController;
	import com.si.controller.IGameController;
	import com.si.controller.IPlayerShipController;
	import com.si.controller.PlayerShipController;
	import com.si.model.BulletsModel;
	import com.si.model.IShipsModel;
	import com.si.model.InvaderShipFactory;
	import com.si.model.PlayerShip;
	import com.si.model.Ship;
	import com.si.model.ShipFactory;
	import com.si.model.ShipsModel;
	import com.si.view.BoardView;
	
	import flash.display.Sprite;
	import flash.utils.Timer;
	
	public class SpaceInvaders extends Sprite
	{
		private var _bulletsModel:BulletsModel;
		private var _shipsModel:IShipsModel;
		
		private var _shipController:IGameController;
		private var _playerShipController:IPlayerShipController;
		
		private var _board:BoardView;
		
		public function SpaceInvaders()
		{
			var timer:Timer = new Timer(1000);
			_bulletsModel = new BulletsModel();
			
			var shipsFactory:ShipFactory = new InvaderShipFactory();
			_shipsModel = new ShipsModel(shipsFactory, 4, 5);
			
			var playerShip:PlayerShip = new PlayerShip(_shipsModel.getPlayerShip());
			
			_board = new BoardView(_shipsModel, _bulletsModel, playerShip);
			addChild(_board);
			
			_shipController = new GameController(_shipsModel, _bulletsModel, _board, timer);
			_playerShipController = new PlayerShipController(playerShip, _bulletsModel, _board.getStage());
		}
	}
}