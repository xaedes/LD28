package ld28.graphics {
	import flash.display.Shape;
	
	public class CircleView extends Shape {
		public function CircleView(radius:Number = 10) {
			with (graphics) {
				beginFill(0xFFFFFF);
				drawCircle(0, 0, radius);
				endFill();
			}
		}
	}
}
