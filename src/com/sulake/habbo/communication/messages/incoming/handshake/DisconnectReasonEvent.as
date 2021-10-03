package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2071:int = 0;
      
      public static const const_1827:int = 1;
      
      public static const const_1773:int = 2;
      
      public static const const_2233:int = 3;
      
      public static const const_2075:int = 4;
      
      public static const const_2157:int = 5;
      
      public static const const_1943:int = 10;
      
      public static const const_2246:int = 11;
      
      public static const const_2263:int = 12;
      
      public static const const_2081:int = 13;
      
      public static const const_2227:int = 16;
      
      public static const const_2231:int = 17;
      
      public static const const_2165:int = 18;
      
      public static const const_2150:int = 19;
      
      public static const const_2133:int = 20;
      
      public static const const_2102:int = 22;
      
      public static const const_2215:int = 23;
      
      public static const const_2253:int = 24;
      
      public static const const_2084:int = 25;
      
      public static const const_2112:int = 26;
      
      public static const const_2085:int = 27;
      
      public static const const_2198:int = 28;
      
      public static const const_2100:int = 29;
      
      public static const const_2159:int = 100;
      
      public static const const_2240:int = 101;
      
      public static const const_2151:int = 102;
      
      public static const const_2138:int = 103;
      
      public static const const_2134:int = 104;
      
      public static const const_2106:int = 105;
      
      public static const const_2095:int = 106;
      
      public static const const_2135:int = 107;
      
      public static const const_2094:int = 108;
      
      public static const const_2228:int = 109;
      
      public static const const_2127:int = 110;
      
      public static const const_2080:int = 111;
      
      public static const const_2213:int = 112;
      
      public static const const_2072:int = 113;
      
      public static const const_2177:int = 114;
      
      public static const const_2154:int = 115;
      
      public static const const_2097:int = 116;
      
      public static const const_2174:int = 117;
      
      public static const const_2132:int = 118;
      
      public static const const_2211:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1827:
            case const_1943:
               return "banned";
            case const_1773:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
