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
		public var thickness:Number
		public var color:uint
		
		public function LineView(from:Point, to:Point, thickness:Number = 1, color:uint = 0xFFFFFF) {
			this.from = from;
			this.to = to;
			this.thickness = thickness;
			this.color = color;
			redraw(0);
		}
		
		public function redraw(time:Number):void {
			graphics.clear();
			graphics.lineStyle(thickness, color);
			graphics.moveTo(from.x, from.y);
			graphics.lineTo(to.x, to.y);
		}
	
	}

}