package ld28.components {
	import ash.core.Entity;
	import ash.signals.Signal1;
	import flash.geom.Point;
	
	public class Position {
		public var position:Point;
		
		public function Position(x:Number, y:Number) {
			position = new Point(x, y);
		}
	}
}
