package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   
   public class Animation implements IDisposable
   {
       
      
      private var var_98:IBitmapWrapperWindow;
      
      private var var_1081:int;
      
      private var var_1326:Boolean;
      
      private var var_223:Array;
      
      public function Animation(param1:IBitmapWrapperWindow)
      {
         this.var_223 = new Array();
         super();
         this.var_98 = param1;
         this.var_98.visible = false;
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.var_98 = null;
         if(this.var_223)
         {
            for each(_loc1_ in this.var_223)
            {
               _loc1_.dispose();
            }
            this.var_223 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_98 == null;
      }
      
      public function addObject(param1:AnimationObject) : void
      {
         this.var_223.push(param1);
      }
      
      public function stop() : void
      {
         this.var_1326 = false;
         this.var_98.visible = false;
      }
      
      public function restart() : void
      {
         var _loc1_:* = null;
         this.var_1081 = 0;
         this.var_1326 = true;
         for each(_loc1_ in this.var_223)
         {
            _loc1_.onAnimationStart();
         }
         this.draw();
         this.var_98.visible = true;
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_1326)
         {
            this.var_1081 += param1;
            this.draw();
         }
      }
      
      private function draw() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_98.bitmap.fillRect(this.var_98.bitmap.rect,0);
         if(this.var_1326)
         {
            _loc1_ = false;
            for each(_loc2_ in this.var_223)
            {
               if(!_loc2_.isFinished(this.var_1081))
               {
                  _loc1_ = true;
                  _loc3_ = _loc2_.getBitmap(this.var_1081);
                  if(_loc3_ != null)
                  {
                     this.var_98.bitmap.copyPixels(_loc3_,_loc3_.rect,_loc2_.getPosition(this.var_1081));
                  }
               }
            }
         }
         this.var_98.invalidate(this.var_98.rectangle);
         this.var_1326 = _loc1_;
      }
   }
}
