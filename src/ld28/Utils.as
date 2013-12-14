package ld28 {
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class Utils {
		public function Utils() {
		
		}
		
		static public function randomRange(min:Number = 0, max:Number = 1):Number {
			return Math.random() * (max - min) + min;
		}
	
	}

}