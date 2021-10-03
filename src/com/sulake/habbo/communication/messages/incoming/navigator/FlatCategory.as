package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2006:int;
      
      private var var_2516:String;
      
      private var var_327:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2006 = param1.readInteger();
         this.var_2516 = param1.readString();
         this.var_327 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2006;
      }
      
      public function get nodeName() : String
      {
         return this.var_2516;
      }
      
      public function get visible() : Boolean
      {
         return this.var_327;
      }
   }
}
