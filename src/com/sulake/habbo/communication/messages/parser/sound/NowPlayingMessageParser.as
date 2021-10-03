package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1964:int;
      
      private var _currentPosition:int;
      
      private var var_1965:int;
      
      private var var_1967:int;
      
      private var var_1966:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1964;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1965;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1967;
      }
      
      public function get syncCount() : int
      {
         return this.var_1966;
      }
      
      public function flush() : Boolean
      {
         this.var_1964 = -1;
         this._currentPosition = -1;
         this.var_1965 = -1;
         this.var_1967 = -1;
         this.var_1966 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1964 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1965 = param1.readInteger();
         this.var_1967 = param1.readInteger();
         this.var_1966 = param1.readInteger();
         return true;
      }
   }
}
