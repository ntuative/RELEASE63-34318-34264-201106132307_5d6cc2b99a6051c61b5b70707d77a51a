package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_63:String = "i";
      
      public static const const_72:String = "s";
      
      public static const const_179:String = "e";
       
      
      private var var_1537:String;
      
      private var var_2710:int;
      
      private var var_993:String;
      
      private var var_1536:int;
      
      private var var_1906:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1537 = param1.readString();
         this.var_2710 = param1.readInteger();
         this.var_993 = param1.readString();
         this.var_1536 = param1.readInteger();
         this.var_1906 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1537;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2710;
      }
      
      public function get extraParam() : String
      {
         return this.var_993;
      }
      
      public function get productCount() : int
      {
         return this.var_1536;
      }
      
      public function get expiration() : int
      {
         return this.var_1906;
      }
   }
}
