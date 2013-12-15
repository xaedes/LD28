package ld28.input {
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	public class MousePoll {
		public var x:Number;
		public var y:Number;
		
		protected var stage:DisplayObject;
		
		public function MousePoll(stage:DisplayObject) {
			this.stage = stage;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		}
		
		public function mouseMove(ev:MouseEvent):void {
			this.x = ev.stageX;
			this.y = ev.stageY;
		}
	}

}