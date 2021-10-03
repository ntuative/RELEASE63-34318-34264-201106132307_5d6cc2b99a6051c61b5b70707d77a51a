package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_103:IVector3d;
      
      protected var var_453:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_103 = param1;
         this.var_453 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_103;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_453;
      }
   }
}
