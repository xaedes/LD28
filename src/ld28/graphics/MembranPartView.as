package ld28.graphics {
	import flash.display.Sprite;
	
	public class MembranPartView extends Sprite {
		public var circleView:CircleView;
		public var circle2View:CircleView;
		
		public function MembranPartView(radius:Number = 10) {
			circleView = new CircleView(radius, 0x354DFF);
			addChild(circleView);
			circle2View = new CircleView(radius * 0.6, 0x35AAFF);
			addChild(circle2View);
		}
	}
}
