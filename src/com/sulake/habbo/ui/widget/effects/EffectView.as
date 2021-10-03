package com.sulake.habbo.ui.widget.effects
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class EffectView
   {
       
      
      private const const_2304:int = 1000;
      
      private var _widget:EffectsWidget;
      
      private var _window:IWindowContainer;
      
      private var var_129:IWidgetAvatarEffect;
      
      private var var_660:IWindow;
      
      private var var_323:Number;
      
      private var var_557:ITextWindow;
      
      private var var_209:Timer;
      
      private var var_659:IWindow;
      
      public function EffectView(param1:EffectsWidget, param2:IWidgetAvatarEffect)
      {
         super();
         this.var_129 = param2;
         this._widget = param1;
         this.var_209 = new Timer(this.const_2304);
         this.var_209.addEventListener(TimerEvent.TIMER,this.onUpdate);
         this.update();
      }
      
      public function get effect() : IWidgetAvatarEffect
      {
         return this.var_129;
      }
      
      public function dispose() : void
      {
         if(this.var_209 != null)
         {
            this.var_209.stop();
            this.var_209.removeEventListener(TimerEvent.TIMER,this.onUpdate);
            this.var_209 = null;
         }
         this._widget = null;
         this.var_129 = null;
         this.var_660 = null;
         this.var_557 = null;
         this.var_659 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_660 == null)
         {
            this.var_209.stop();
            return;
         }
         if(this.var_129.isActive)
         {
            _loc2_ = this.var_129.secondsLeft / Number(this.var_129.duration);
            this.var_660.width = _loc2_ * this.var_323;
         }
         else
         {
            this.var_660.width = 0;
            this.var_209.stop();
         }
         this.setTimeLeft();
      }
      
      private function setTimeLeft() : void
      {
         if(this.var_557 == null)
         {
            this.var_557 = this._window.findChildByName("time_left") as ITextWindow;
            if(this.var_557 == null)
            {
               return;
            }
         }
         if(!this.var_129.isActive)
         {
            this.var_557.caption = "${widgets.memenu.effects.activate}";
            return;
         }
         this.var_557.caption = "${widgets.memenu.effects.active.timeleft}";
         var _loc1_:String = this.var_557.text;
         var _loc2_:int = this.var_129.secondsLeft;
         var _loc3_:int = Math.floor(_loc2_ / 3600);
         var _loc4_:int = Math.floor(_loc2_ / 60) % 60;
         var _loc5_:int = _loc2_ % 60;
         var _loc6_:String = _loc3_ < 10 ? "0" : "";
         var _loc7_:String = _loc4_ < 10 ? "0" : "";
         var _loc8_:String = _loc5_ < 10 ? "0" : "";
         if(_loc3_ > 0)
         {
            _loc1_ = _loc1_.replace("%time_left%",_loc6_ + _loc3_ + ":" + _loc7_ + _loc4_ + ":" + _loc8_ + _loc5_);
         }
         else
         {
            _loc1_ = _loc1_.replace("%time_left%",_loc7_ + _loc4_ + ":" + _loc8_ + _loc5_);
         }
         this.var_557.text = _loc1_;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(!this._window)
         {
            this._window = this._widget.windowManager.createWindow("","",HabboWindowType.const_78,HabboWindowStyle.const_31,HabboWindowParam.const_65) as IWindowContainer;
         }
         while(this._window.numChildren > 0)
         {
            _loc7_ = this._window.removeChildAt(0);
            _loc7_.dispose();
         }
         this.var_660 = null;
         this.var_659 = null;
         this.var_557 = null;
         var _loc2_:String = "";
         if(this.var_129.isInUse)
         {
            _loc2_ = "memenu_effect_selected";
         }
         else if(this.var_129.isActive)
         {
            _loc2_ = "memenu_effect_unselected";
         }
         else
         {
            _loc2_ = "memenu_effect_inactive";
         }
         _loc1_ = this._widget.assets.getAssetByName(_loc2_) as XmlAsset;
         var _loc3_:IWindowContainer = this._widget.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         this._window.addChild(_loc3_);
         var _loc4_:ITextWindow = this._window.findChildByName("effect_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.caption = "${fx_" + this.var_129.type + "}";
         }
         var _loc5_:ITextWindow = this._window.findChildByName("effect_amount") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.caption = this.var_129.effectsInInventory + "";
         }
         var _loc6_:IWindowContainer = this._window.findChildByName("effect_amount_bg1") as IWindowContainer;
         if(this.var_129.effectsInInventory < 2)
         {
            if(_loc6_ != null)
            {
               _loc6_.visible = false;
            }
         }
         if(_loc2_ == "memenu_effect_inactive")
         {
            _loc8_ = this._window.findChildByName("activate_effect") as IButtonWindow;
            if(_loc8_ != null)
            {
               _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            }
         }
         else
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            if(this.var_129.isActive)
            {
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseEvent);
               _loc3_.addEventListener(WindowMouseEvent.const_25,this.onMouseEvent);
            }
            if(this.var_129.isInUse)
            {
               this.setElementImage("effect_hilite","memenu_fx_pause");
            }
            else
            {
               this.setElementImage("effect_hilite","memenu_fx_play");
            }
            this.var_659 = this._window.findChildByName("effect_hilite");
            this.var_659.visible = false;
         }
         this.setTimeLeft();
         this.var_660 = this._window.findChildByName("loader_bar");
         if(this.var_660 != null)
         {
            this.var_323 = this.var_660.width;
            this.var_209.start();
            this.onUpdate();
         }
         if(this.var_129.icon)
         {
            this.setElementBitmap("effect_icon",this.var_129.icon);
         }
         this._window.rectangle = _loc3_.rectangle;
      }
      
      private function setElementBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            if(_loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
         else
         {
            Logger.log("Could not find element: " + param1);
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(this.var_659 != null)
               {
                  this.var_659.visible = true;
               }
               break;
            case WindowMouseEvent.const_25:
               if(this.var_659 != null)
               {
                  this.var_659.visible = false;
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               this._widget.selectEffect(this.var_129.type,this.var_129.isInUse);
         }
      }
      
      private function setElementImage(param1:String, param2:String) : void
      {
         var _loc3_:BitmapDataAsset = this._widget.assets.getAssetByName(param2) as BitmapDataAsset;
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         this.setElementBitmap(param1,_loc4_);
      }
   }
}
