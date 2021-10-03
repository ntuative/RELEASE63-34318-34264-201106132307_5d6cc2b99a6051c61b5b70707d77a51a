package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent
   {
      
      public static const PET_COMMANDS:String = "RSPIUE_ENABLED_PET_COMMANDS";
       
      
      private var var_1781:int;
      
      private var var_2397:Array;
      
      private var var_2398:Array;
      
      public function RoomSessionPetCommandsUpdateEvent(param1:IRoomSession, param2:int, param3:Array, param4:Array, param5:Boolean = false, param6:Boolean = false)
      {
         super(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,param1,param5,param6);
         this.var_1781 = param2;
         this.var_2397 = param3;
         this.var_2398 = param4;
      }
      
      public function get petId() : int
      {
         return this.var_1781;
      }
      
      public function get allCommands() : Array
      {
         return this.var_2397;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_2398;
      }
   }
}
