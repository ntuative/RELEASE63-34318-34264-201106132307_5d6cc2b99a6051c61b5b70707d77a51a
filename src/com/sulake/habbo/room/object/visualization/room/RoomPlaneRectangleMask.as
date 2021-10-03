package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2292:Number = 0.0;
      
      private var var_2295:Number = 0.0;
      
      private var var_2293:Number = 0.0;
      
      private var var_2294:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2292 = param1;
         this.var_2295 = param2;
         this.var_2293 = param3;
         this.var_2294 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2292;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2295;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2293;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2294;
      }
   }
}
