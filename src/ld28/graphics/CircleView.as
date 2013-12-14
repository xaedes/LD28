package ld28.graphics {
	import flash.display.Shape;
	
	public class CircleView extends Shape {
		public function CircleView() {
			with (graphics) {
				beginFill(0xFFFFFF);
				drawCircle(0, 0, 100);
				endFill();
			}
		}
	}
}
