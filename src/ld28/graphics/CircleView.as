package ld28.graphics {
	import flash.display.Shape;
	
	public class CircleView extends Shape {
		public function CircleView(radius:Number = 10, color:uint = 0xFFFFFF) {
			with (graphics) {
				beginFill(color);
				drawCircle(0, 0, radius);
				endFill();
			}
		}
	}
}
