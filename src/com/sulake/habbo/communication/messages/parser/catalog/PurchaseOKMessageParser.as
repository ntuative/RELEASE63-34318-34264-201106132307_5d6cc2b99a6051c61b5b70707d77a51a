package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   
   public class PurchaseOKMessageParser implements IMessageParser
   {
       
      
      private var var_105:CatalogPageMessageOfferData;
      
      public function PurchaseOKMessageParser()
      {
         super();
      }
      
      public function get offer() : CatalogPageMessageOfferData
      {
         return this.var_105;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_105 = new CatalogPageMessageOfferData(param1);
         return true;
      }
   }
}
