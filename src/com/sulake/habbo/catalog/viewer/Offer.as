package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1861:String = "pricing_model_unknown";
      
      public static const const_423:String = "pricing_model_single";
      
      public static const const_387:String = "pricing_model_multi";
      
      public static const const_515:String = "pricing_model_bundle";
      
      public static const const_1973:String = "price_type_none";
      
      public static const const_870:String = "price_type_credits";
      
      public static const const_1326:String = "price_type_activitypoints";
      
      public static const const_1343:String = "price_type_credits_and_activitypoints";
       
      
      private var var_872:String;
      
      private var var_1316:String;
      
      private var var_1229:int;
      
      private var var_2055:String;
      
      private var var_1318:int;
      
      private var var_1317:int;
      
      private var var_2056:int;
      
      private var var_389:ICatalogPage;
      
      private var var_700:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2134:int = 0;
      
      private var include:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1229 = param1;
         this.var_2055 = param2;
         this.var_1318 = param3;
         this.var_1317 = param4;
         this.var_2056 = param5;
         this.var_389 = param8;
         this.var_2134 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_2134;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_389;
      }
      
      public function get offerId() : int
      {
         return this.var_1229;
      }
      
      public function get localizationId() : String
      {
         return this.var_2055;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1318;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1317;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2056;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_700;
      }
      
      public function get pricingModel() : String
      {
         return this.var_872;
      }
      
      public function get priceType() : String
      {
         return this.var_1316;
      }
      
      public function get previewCallbackId() : int
      {
         return this.include;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.include = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1229 = 0;
         this.var_2055 = "";
         this.var_1318 = 0;
         this.var_1317 = 0;
         this.var_2056 = 0;
         this.var_389 = null;
         if(this.var_700 != null)
         {
            this.var_700.dispose();
            this.var_700 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_872)
         {
            case const_423:
               this.var_700 = new SingleProductContainer(this,param1);
               break;
            case const_387:
               this.var_700 = new MultiProductContainer(this,param1);
               break;
            case const_515:
               this.var_700 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_872);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_872 = const_423;
            }
            else
            {
               this.var_872 = const_387;
            }
         }
         else if(param1.length > 1)
         {
            this.var_872 = const_515;
         }
         else
         {
            this.var_872 = const_1861;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1318 > 0 && this.var_1317 > 0)
         {
            this.var_1316 = const_1343;
         }
         else if(this.var_1318 > 0)
         {
            this.var_1316 = const_870;
         }
         else if(this.var_1317 > 0)
         {
            this.var_1316 = const_1326;
         }
         else
         {
            this.var_1316 = const_1973;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_389.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_700.products)
         {
            _loc4_ = this.var_389.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
