package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_2145:int;
      
      private var var_2474:String;
      
      private var var_2144:String;
      
      private var _index:int;
      
      private var _category:FaqCategory;
      
      private var var_2473:Boolean = false;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         this.var_2145 = param1;
         this.var_2474 = param2;
         this._index = param3;
         this._category = param4;
      }
      
      public function get questionId() : int
      {
         return this.var_2145;
      }
      
      public function get questionText() : String
      {
         return this.var_2474;
      }
      
      public function get answerText() : String
      {
         return this.var_2144;
      }
      
      public function get hasAnswer() : Boolean
      {
         return this.var_2473;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get category() : FaqCategory
      {
         return this._category;
      }
      
      public function set answerText(param1:String) : void
      {
         this.var_2144 = param1;
         this.var_2473 = true;
      }
   }
}
