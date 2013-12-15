package ld28.graphics {
	import flash.display.Shape;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class LineView extends Shape implements Redrawable {
		public var from:Point;
		public var to:Point;
		
		public function LineView(from:Point, to:Point) {
			this.from = from;
			this.to = to;
			redraw(0);
		}
		
		public function redraw(time:Number):void {
			graphics.clear();
			graphics.moveTo(from.x, from.y);
			graphics.lineTo(to.x, to.y);
		}
	
	}

}