package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1250:int = 1;
      
      public static const const_584:int = 2;
      
      private static const const_1075:int = 5;
      
      private static const const_1541:int = 250;
      
      private static const const_1540:int = 100;
      
      private static const const_1538:int = 180;
      
      private static const const_1539:int = 200;
       
      
      private var var_385:Timer;
      
      private var var_386:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_91:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_1873:int = 2;
      
      private var var_812:BitmapData;
      
      private var var_985:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_385 = new Timer(const_1541,1);
         this.var_386 = new Timer(const_1540,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_91 = param1;
         this.var_91.visible = false;
         this._assets = param2;
         this.var_385.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_386.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_985 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_812 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_385 != null)
         {
            this.var_385.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_385.stop();
            this.var_385 = null;
         }
         if(this.var_386 != null)
         {
            this.var_386.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_386.stop();
            this.var_386 = null;
         }
         this._assets = null;
         this.var_91 = null;
         this._parent = null;
         this.var_812 = null;
         this.var_985 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_91 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_91);
         }
         this._parent = param1;
         this.var_1873 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_91.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_91.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1538,param3.width),Math.min(const_1539,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_91.width - _loc6_.width) / 2;
            this.var_91.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_386.reset();
         this.var_385.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_91.visible = true;
         this._parent.addChild(this.var_91);
         this.refreshArrow(this.var_1873);
         switch(this.var_1873)
         {
            case const_1250:
               this.var_91.x = -1 * this.var_91.width - const_1075;
               break;
            case const_584:
               this.var_91.x = this._parent.width + const_1075;
         }
         this.var_91.y = (this._parent.height - this.var_91.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_91.visible = false;
         this.var_386.reset();
         this.var_385.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_91);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_386.reset();
         this.var_385.reset();
         this.var_385.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_386.reset();
         this.var_385.reset();
         this.var_386.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_91 == null || this.var_91.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_91.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1250:
               _loc2_.bitmap = this.var_985.clone();
               _loc2_.width = this.var_985.width;
               _loc2_.height = this.var_985.height;
               _loc2_.y = (this.var_91.height - this.var_985.height) / 2;
               _loc2_.x = this.var_91.width - 1;
               break;
            case const_584:
               _loc2_.bitmap = this.var_812.clone();
               _loc2_.width = this.var_812.width;
               _loc2_.height = this.var_812.height;
               _loc2_.y = (this.var_91.height - this.var_812.height) / 2;
               _loc2_.x = -1 * this.var_812.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
