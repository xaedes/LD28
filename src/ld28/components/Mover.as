package ld28.components {
	import ld28.graphics.MoverView;
	
	public class Mover {
		public var moverView:MoverView = null;
		public var energyConsumption:Number;
		
		public function Mover(moverView:MoverView, energyConsumption:Number) {
			this.moverView = moverView;
			this.energyConsumption = energyConsumption;
		}
	}
}
