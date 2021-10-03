package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2226:int = 1;
      
      public static const const_2090:int = 2;
      
      public static const const_2235:int = 3;
      
      public static const const_2269:int = 4;
      
      public static const const_1707:int = 5;
      
      public static const const_2107:int = 6;
      
      public static const const_1815:int = 7;
      
      public static const const_1880:int = 8;
      
      public static const const_2131:int = 9;
      
      public static const const_1775:int = 10;
      
      public static const const_1953:int = 11;
      
      public static const const_1725:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1742:int;
      
      private var var_708:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1742 = param1.readInteger();
         this.var_708 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1742;
      }
      
      public function get info() : String
      {
         return this.var_708;
      }
   }
}
