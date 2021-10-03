package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1594:int = 3;
      
      private static const const_1496:int = 2;
      
      private static const const_1497:int = 1;
      
      private static const const_1498:int = 15;
       
      
      private var var_338:Array;
      
      private var var_1197:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_338 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1496)
         {
            this.var_338 = new Array();
            this.var_338.push(const_1497);
            this.var_1197 = const_1498;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1197 > 0)
         {
            --this.var_1197;
         }
         if(this.var_1197 == 0)
         {
            if(this.var_338.length > 0)
            {
               super.setAnimation(this.var_338.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
