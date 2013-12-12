package com.si.model
{
	public class Config implements IConfig
	{
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		private var _currentUID:uint = 0;
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Config()
		{}
		
		//--------------------------------------------------------------------------
		//
		//	Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function getBoardHeight():uint
		{
			return 0;
		}
		
		public function getBoardWidth():uint
		{
			return 0;
		}
		
		public function getUID():uint
		{
			return ++_currentUID;
		}
	}
}