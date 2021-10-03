package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2456:String;
      
      private var var_1826:String;
      
      private var var_2455:String;
      
      private var var_1828:Boolean;
      
      private var var_1827:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2456 = String(param1["set-type"]);
         this.var_1826 = String(param1["flipped-set-type"]);
         this.var_2455 = String(param1["remove-set-type"]);
         this.var_1828 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1827 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1827;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1827 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2456;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1826;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2455;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1828;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1828 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1826 = param1;
      }
   }
}
