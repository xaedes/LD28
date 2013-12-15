package ld28.etc {
	import de.polygonal.ds.DLL;
	import flash.geom.Rectangle;
	
	public class GridCell {
		public var x:int;
		public var y:int;
		public var gridSize:Number;
		public var rect:Rectangle;
		public var nodes:DLL = new DLL(10);
		
		public function GridCell(x:int, y:int, gridSize:Number) {
			this.x = x;
			this.y = y;
			this.gridSize = gridSize;
			this.rect = new Rectangle(x * gridSize, y * gridSize, gridSize, gridSize);
		}
	}

}