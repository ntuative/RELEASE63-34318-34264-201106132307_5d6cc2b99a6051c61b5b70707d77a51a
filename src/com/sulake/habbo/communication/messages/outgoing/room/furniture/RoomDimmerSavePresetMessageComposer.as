package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2835:int;
      
      private var var_2836:int;
      
      private var var_2904:String;
      
      private var var_2903:int;
      
      private var var_2905:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2835 = param1;
         this.var_2836 = param2;
         this.var_2904 = param3;
         this.var_2903 = param4;
         this.var_2905 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2835,this.var_2836,this.var_2904,this.var_2903,int(this.var_2905)];
      }
      
      public function dispose() : void
      {
      }
   }
}
