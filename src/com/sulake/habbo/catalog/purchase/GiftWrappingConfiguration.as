package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1577:Boolean = false;
      
      private var var_1808:int;
      
      private var var_1909:Array;
      
      private var var_816:Array;
      
      private var var_817:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1577 = _loc2_.isWrappingEnabled;
         this.var_1808 = _loc2_.wrappingPrice;
         this.var_1909 = _loc2_.stuffTypes;
         this.var_816 = _loc2_.boxTypes;
         this.var_817 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1577;
      }
      
      public function get price() : int
      {
         return this.var_1808;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1909;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_816;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_817;
      }
   }
}
