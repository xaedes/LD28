package ld28.graphics {
	import flash.display.Shape;
	
	public class EnergyStorageView extends Shape {
		public var radius:Number;
		public var max:Number;
		public var value:Number;
		
		public function EnergyStorageView(radius:Number, max:Number = 0, value:Number = 0) {
			this.radius = radius;
			this.value = value;
			draw();
		}
		
		public function setMax(max:Number):void {
			this.max = max;
			draw();
		}
		
		public function setValue(value:Number):void {
			this.value = value;
			draw();
		}
		
		public function draw():void {
			var color:uint;
			if ((value <= max) && (value >= 0) && (max > 0)) {
				color = (uint)(255 * value / max);
			} else if ((max == 0) || (value > max)) {
				color = 255;
				
			} else {
				color = 0;
			}
			trace(value);
			color = 0x010101 * color;
			graphics.clear();
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}
}
