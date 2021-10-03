package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2692:String;
      
      private var var_2693:Class;
      
      private var var_2691:Class;
      
      private var var_1982:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2692 = param1;
         this.var_2693 = param2;
         this.var_2691 = param3;
         if(rest == null)
         {
            this.var_1982 = new Array();
         }
         else
         {
            this.var_1982 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2692;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2693;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2691;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1982;
      }
   }
}
