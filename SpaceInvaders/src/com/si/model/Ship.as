package com.si.model
{
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	
	public class Ship
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private var _id:uint
		private var _type:String;
		private var _properties:Dictionary;
		
		private var _x:uint;
		private var _y:uint;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Ship()
		{
			super();
			
			initialize();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function get id():uint
		{
			return _id;
		}

		public function set id(value:uint):void
		{
			_id = value;
		}

		public function get y():uint
		{
			return _y;
		}

		public function set y(value:uint):void
		{
			_y = value;
		}

		public function get x():uint
		{
			return _x;
		}

		public function set x(value:uint):void
		{
			_x = value;
		}

		public function addEventListeners():void
		{
			
		}
		
		public function getProperty(property:String):Object
		{
			return _properties[property];
		}
		
		public function setProperty(property:String, value:Object):void
		{
			_properties[property] = value;
		}
		
		public function checkHit():Boolean
		{
			return false;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private Methods
		//
		//--------------------------------------------------------------------------
		
		private function initialize():void
		{
			_properties = new Dictionary();
			
			addEventListeners();
		}		
	}
}
