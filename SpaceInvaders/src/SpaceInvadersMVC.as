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
	
	public class SpaceInvadersMVC extends Sprite
	{
		private var _bulletsModel:BulletsModel;
		private var _shipsModel:IShipsModel;
		
		private var _shipController:IGameController;
		private var _playerShipController:IPlayerShipController;
		
		private var _board:BoardView;
		
		public function SpaceInvadersMVC()
		{
			var shipsFactory:ShipFactory = new InvaderShipFactory();
			_shipsModel = new ShipsModel(shipsFactory, 4, 5);
			
			var playerShip:PlayerShip = new PlayerShip(_shipsModel.getPlayerShip());
			
			_board = new BoardView(_shipsModel, playerShip);
			addChild(_board);
			
			var timer:Timer = new Timer(1000);
			_shipController = new GameController(_shipsModel, null, _board, timer);
			
			
			_playerShipController = new PlayerShipController(playerShip, null, _board.getStage());
		}
	}
}