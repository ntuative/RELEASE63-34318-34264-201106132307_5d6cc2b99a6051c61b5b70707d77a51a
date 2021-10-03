package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_150:String = "hex";
      
      public static const const_40:String = "int";
      
      public static const const_276:String = "uint";
      
      public static const const_130:String = "Number";
      
      public static const const_35:String = "Boolean";
      
      public static const const_51:String = "String";
      
      public static const const_291:String = "Point";
      
      public static const const_277:String = "Rectangle";
      
      public static const const_140:String = "Array";
      
      public static const const_263:String = "Map";
       
      
      private var var_719:String;
      
      private var var_208:Object;
      
      private var _type:String;
      
      private var var_2928:Boolean;
      
      private var var_3045:Boolean;
      
      private var var_2927:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_719 = param1;
         this.var_208 = param2;
         this._type = param3;
         this.var_2928 = param4;
         this.var_3045 = param3 == const_263 || param3 == const_140 || param3 == const_291 || param3 == const_277;
         this.var_2927 = param5;
      }
      
      public function get key() : String
      {
         return this.var_719;
      }
      
      public function get value() : Object
      {
         return this.var_208;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2928;
      }
      
      public function get range() : Array
      {
         return this.var_2927;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_150:
               return "0x" + uint(this.var_208).toString(16);
            case const_35:
               return Boolean(this.var_208) == true ? "true" : "PresentHandler";
            case const_291:
               return "Point(" + Point(this.var_208).x + ", " + Point(this.var_208).y + ")";
            case const_277:
               return "Rectangle(" + Rectangle(this.var_208).x + ", " + Rectangle(this.var_208).y + ", " + Rectangle(this.var_208).width + ", " + Rectangle(this.var_208).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_263:
               _loc3_ = this.var_208 as Map;
               _loc1_ = "<var key=\"" + this.var_719 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_140:
               _loc4_ = this.var_208 as Array;
               _loc1_ = "<var key=\"" + this.var_719 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_291:
               _loc5_ = this.var_208 as Point;
               _loc1_ = "<var key=\"" + this.var_719 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_277:
               _loc6_ = this.var_208 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_719 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_150:
               _loc1_ = "<var key=\"" + this.var_719 + "\" value=\"" + "0x" + uint(this.var_208).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_719 + "\" value=\"" + this.var_208 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
