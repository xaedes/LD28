package ld28.graphics {
	import flash.display.Sprite;
	
	public class MoverView extends Sprite {
		public var circleView:CircleView;
		
		public function MoverView(radius:Number = 10) {
			circleView = new CircleView(radius);
			addChild(circleView);
		}
	}
}
