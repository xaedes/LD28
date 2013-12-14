package ld28.components {
	import flash.geom.Point;
	
	public class Motion {
		public var velocity:Point = new Point();
		public var damping:Number = 0;
		
		public function Motion(velocityX:Number, velocityY:Number, damping:Number) {
			velocity = new Point(velocityX, velocityY);
			this.damping = damping;
		}
	}
}
