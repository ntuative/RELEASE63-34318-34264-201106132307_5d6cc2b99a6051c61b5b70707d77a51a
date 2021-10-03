package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1118:int = 20;
      
      private static const const_706:int = 9;
      
      private static const const_1594:int = -1;
       
      
      private var var_338:Array;
      
      private var var_792:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_338 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_792)
            {
               this.var_792 = true;
               this.var_338 = new Array();
               this.var_338.push(const_1594);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_792)
            {
               this.var_792 = false;
               this.var_338 = new Array();
               this.var_338.push(const_1118);
               this.var_338.push(const_706 + param1);
               this.var_338.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_338.length > 0)
            {
               super.setAnimation(this.var_338.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
