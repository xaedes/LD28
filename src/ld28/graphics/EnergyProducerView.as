package ld28.graphics {
	import flash.display.Sprite;
	
	public class EnergyProducerView extends Sprite {
		public var circleView:CircleView;
		public var energyStorageView:EnergyStorageView;
		
		public function EnergyProducerView(radius:Number = 10) {
			circleView = new CircleView(radius, 0x007F0E);
			addChild(circleView);
			energyStorageView = new EnergyStorageView(radius * 0.5);
			addChild(energyStorageView);
		}
	}
}
