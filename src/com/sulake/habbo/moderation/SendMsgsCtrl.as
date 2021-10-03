package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_37:ModerationManager;
      
      private var var_1647:int;
      
      private var var_1975:String;
      
      private var var_1648:String;
      
      private var _frame:IFrameWindow;
      
      private var var_1272:IDropMenuWindow;
      
      private var var_583:ITextFieldWindow;
      
      private var _disposed:Boolean;
      
      private var var_608:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         this.var_37 = param1;
         this.var_1647 = param2;
         this.var_1975 = param3;
         this.var_1648 = param4;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_37.getXmlWindow("send_msgs"));
         this._frame.caption = "Msg To: " + this.var_1975;
         this._frame.findChildByName("send_message_but").procedure = this.onSendMessageButton;
         this.var_583 = ITextFieldWindow(this._frame.findChildByName("message_input"));
         this.var_583.procedure = this.onInputClick;
         this.var_1272 = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
         this.prepareMsgSelect(this.var_1272);
         this.var_1272.procedure = this.onSelectTemplate;
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this._frame.visible = true;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1972;
      }
      
      public function getId() : String
      {
         return this.var_1975;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + this.var_37.initMsg.messageTemplates.length);
         param1.populate(this.var_37.initMsg.messageTemplates);
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_48)
         {
            return;
         }
         var _loc3_:String = this.var_37.initMsg.messageTemplates[this.var_1272.selection];
         if(_loc3_ != null)
         {
            this.var_608 = false;
            this.var_583.text = _loc3_;
         }
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(this.var_608 || this.var_583.text == "")
         {
            this.var_37.windowManager.alert("Alert","You must input a message to the user",0,this.onAlertClose);
            return;
         }
         this.var_37.connection.send(new ModMessageMessageComposer(this.var_1647,this.var_583.text,this.var_1648));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_335)
         {
            return;
         }
         if(!this.var_608)
         {
            return;
         }
         this.var_583.text = "";
         this.var_608 = false;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         this.var_1272 = null;
         this.var_583 = null;
         this.var_37 = null;
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:WindowEvent) : void
      {
         param1.dispose();
      }
   }
}
