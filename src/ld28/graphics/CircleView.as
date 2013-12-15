package ld28.graphics {
	import flash.display.Shape;
	
	public class CircleView extends Shape {
		public function CircleView(radius:Number = 10, color:uint = 0xFFFFFF, alpha:Number = 1) {
			graphics.beginFill(color, alpha);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}
}
