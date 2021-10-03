package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1972:int;
      
      private var var_2613:String;
      
      private var var_1036:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1972 = param1.readInteger();
         this.var_2613 = param1.readString();
         this.var_1036 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1972;
      }
      
      public function get figureString() : String
      {
         return this.var_2613;
      }
      
      public function get gender() : String
      {
         return this.var_1036;
      }
   }
}
