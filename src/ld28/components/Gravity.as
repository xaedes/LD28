package ld28.components {
	import flash.geom.Point;
	
	public class Gravity {
		public var towards:Point;
		public var strength:Number;
		
		public function Gravity(towards:Point, strength:Number) {
			this.towards = towards;
			this.strength = strength;
		}
	}

}