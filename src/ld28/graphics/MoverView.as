package ld28.graphics {
	import flash.display.Sprite;
	
	public class MoverView extends Sprite {
		public var circleView:CircleView;
		public var energyStorageView:EnergyStorageView;
		
		public function MoverView(radius:Number = 10) {
			circleView = new CircleView(radius);
			addChild(circleView);
			energyStorageView = new EnergyStorageView(radius * 0.8);
			addChild(energyStorageView);
		}
	}
}
