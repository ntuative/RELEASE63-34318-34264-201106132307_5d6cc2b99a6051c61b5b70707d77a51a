package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements IDisposable
   {
      
      private static const const_703:uint = 0;
      
      private static const const_1100:uint = 1;
      
      private static const const_1101:uint = 2;
       
      
      private var var_136:BitmapData;
      
      private var var_170:WindowRenderer;
      
      private var _skinContainer:ISkinContainer;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _disposed:Boolean;
      
      private var var_695:Boolean;
      
      private var var_204:Rectangle;
      
      private var var_1132:Matrix;
      
      private var var_804:ColorTransform;
      
      private var var_1617:uint;
      
      private var var_1069:uint;
      
      public function WindowRendererItem(param1:WindowRenderer, param2:DrawBufferAllocator, param3:ISkinContainer)
      {
         super();
         this._disposed = false;
         this.var_170 = param1;
         this._skinContainer = param3;
         this._drawBufferAllocator = param2;
         this.var_1617 = 4294967295;
         this.var_1069 = 0;
         this.var_804 = new ColorTransform();
         this.var_1132 = new Matrix();
         this.var_204 = new Rectangle();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get buffer() : BitmapData
      {
         return this.var_136;
      }
      
      public function get dirty() : Rectangle
      {
         return this.var_204;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_170 = null;
            this._skinContainer = null;
            if(this.var_136 != null)
            {
               this._drawBufferAllocator.free(this.var_136);
               this.var_136 = null;
            }
         }
      }
      
      public function render(param1:IWindow, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc12_:Boolean = false;
         var _loc5_:uint = !!param1.background ? uint(const_1101) : uint(const_703);
         var _loc6_:Boolean = this.var_204.width > 0 && this.var_204.height > 0;
         var _loc7_:ISkinRenderer = this.resolveSkinRenderer(param1);
         if(_loc7_ != null)
         {
            if(_loc7_.isStateDrawable(this.var_1069))
            {
               _loc5_ = const_1100;
            }
         }
         var _loc8_:int = Math.max(param1.width,1);
         var _loc9_:int = Math.max(param1.height,1);
         var _loc10_:Boolean = true;
         if(_loc5_ != const_703)
         {
            if(this.var_136 == null)
            {
               this.var_136 = this._drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               this.var_695 = true;
               _loc6_ = true;
               _loc10_ = false;
            }
            else if(this.var_136.width != _loc8_ || this.var_136.height != _loc9_)
            {
               this._drawBufferAllocator.free(this.var_136);
               this.var_136 = this._drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               this.var_695 = true;
               _loc6_ = true;
               _loc10_ = false;
            }
         }
         var _loc11_:IGraphicContext = IGraphicContextHost(param1).getGraphicContext(false);
         if(_loc11_)
         {
            if(!_loc11_.visible)
            {
               _loc11_.visible = true;
            }
            _loc12_ = param1.testParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING);
            _loc11_.setDrawRegion(param1.rectangle,!param1.testParamFlag(WindowParam.const_33),!!_loc12_ ? param3 : null);
            if(_loc12_)
            {
               param3 = new Rectangle(0,0,_loc8_,_loc9_);
            }
         }
         if(_loc5_ != const_703)
         {
            this.var_1617 = this.var_1069;
            _loc4_ = param1.fetchDrawBuffer() as BitmapData;
            if(_loc4_ != null)
            {
               _loc4_.lock();
               if(_loc5_ == const_1100)
               {
                  _loc6_ = true;
                  if(!param1.testParamFlag(WindowParam.const_33))
                  {
                     _loc4_.fillRect(param3,0);
                  }
                  if(this.var_695)
                  {
                     this.var_695 = false;
                     if(_loc10_)
                     {
                        this.var_136.fillRect(this.var_136.rect,param1.color);
                     }
                     _loc7_.draw(param1,this.var_136,this.var_136.rect,this.var_1069,false);
                  }
                  if(param1.blend < 1 && param1.testParamFlag(WindowParam.const_33))
                  {
                     this.var_1132.tx = param2.x;
                     this.var_1132.ty = param2.y;
                     this.var_804.alphaMultiplier = param1.blend;
                     param3.offset(param2.x,param2.y);
                     _loc4_.draw(this.var_136,this.var_1132,this.var_804,null,param3,false);
                     param3.offset(-param2.x,-param2.y);
                  }
                  else
                  {
                     _loc4_.copyPixels(this.var_136,param3,param2,null,null,true);
                  }
               }
               else if(_loc5_ == const_1101)
               {
                  _loc6_ = true;
                  if(param1.testParamFlag(WindowParam.const_33))
                  {
                     this.var_136.fillRect(this.var_136.rect,param1.color);
                     _loc4_.copyPixels(this.var_136,param3,param2,null,null,true);
                  }
                  else
                  {
                     _loc4_.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc11_.blend = param1.blend;
                  }
               }
               _loc4_.unlock();
            }
            this.var_204.left = int.MAX_VALUE;
            this.var_204.top = int.MAX_VALUE;
            this.var_204.right = int.MIN_VALUE;
            this.var_204.bottom = int.MIN_VALUE;
         }
         return true;
      }
      
      private function resolveSkinRenderer(param1:IWindow) : ISkinRenderer
      {
         var _loc2_:ISkinRenderer = this._skinContainer.getSkinRendererByTypeAndStyle(param1.type,param1.style);
         if(_loc2_ == null)
         {
            if(param1.style != WindowStyle.const_106)
            {
               _loc2_ = this._skinContainer.getSkinRendererByTypeAndStyle(param1.type,WindowStyle.const_106);
            }
         }
         return _loc2_;
      }
      
      public function testForStateChange(param1:IWindow) : Boolean
      {
         return this._skinContainer.getTheActualState(param1.type,param1.style,param1.state) != this.var_1617;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         switch(param3)
         {
            case WindowRedrawFlag.const_61:
               this.var_695 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.RESIZE:
               this.var_695 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.const_1189:
               if(param1.testParamFlag(WindowParam.const_33))
               {
                  _loc4_ = true;
               }
               else
               {
                  _loc5_ = IGraphicContextHost(param1).getGraphicContext(true);
                  _loc5_.setDrawRegion(param1.rectangle,false,null);
                  if(!_loc5_.visible)
                  {
                     _loc4_ = true;
                  }
               }
               break;
            case WindowRedrawFlag.const_884:
               this.var_1069 = this._skinContainer.getTheActualState(param1.type,param1.style,param1.state);
               if(this.var_1069 != this.var_1617)
               {
                  this.var_695 = true;
                  _loc4_ = true;
               }
               break;
            case WindowRedrawFlag.const_1258:
               if(param1.testParamFlag(WindowParam.const_33))
               {
                  this.var_695 = true;
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               }
               break;
            case WindowRedrawFlag.const_1311:
               _loc4_ = true;
         }
         if(_loc4_)
         {
            this.var_204.left = Math.min(this.var_204.left,param2.left);
            this.var_204.top = Math.min(this.var_204.top,param2.top);
            this.var_204.right = Math.max(this.var_204.right,param2.right);
            this.var_204.bottom = Math.max(this.var_204.bottom,param2.bottom);
         }
         return _loc4_;
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
   }
}
