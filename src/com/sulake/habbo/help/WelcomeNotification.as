package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2317:String;
      
      private var var_2316:String;
      
      public function WelcomeNotification(param1:String, param2:String)
      {
         super();
         this.var_2317 = param1;
         this.var_2316 = param2;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2317;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2316;
      }
   }
}
