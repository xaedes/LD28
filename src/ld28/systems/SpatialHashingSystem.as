package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import de.polygonal.ds.Array2;
	import de.polygonal.ds.DLLNode;
	import ld28.etc.GridCell;
	import ld28.GameConfig;
	import ld28.nodes.SpatialHashingNode;
	
	// spatial hashing
	//  "Basically, you establish a grid and mark down what's in touch with each grid. (It 
	//   doesn't have to be perfect -- it could be what axis-aligned bounding boxes are in 
	//   each grid, even.) Then, later you go through the relevant cells of the grid and 
	//   check if everything in each relevant cell is actually intersecting with anything 
	//   else in the cell."
	// http://stackoverflow.com/a/6908607/798588
	
	public class SpatialHashingSystem extends ListIteratingSystem {
		private var config:GameConfig;
		
		public var gridSize:Number;
		public var gridWidth:int;
		public var gridHeight:int;
		private var grid:Array2;
		
		public function SpatialHashingSystem(config:GameConfig, gridSize:Number = 50) {
			super(SpatialHashingNode, updateNode, addNode, removeNode);
			this.config = config;
			this.gridSize = gridSize;
			this.gridWidth = int(Math.max(2, Math.ceil(this.config.width / this.gridSize)));
			this.gridHeight = int(Math.max(2, Math.ceil(this.config.height / this.gridSize)));
			this.grid = new Array2(gridWidth, gridHeight);
			for (var x:int = 0; x < gridWidth; x++) {
				for (var y:int = 0; y < gridHeight; y++) {
					grid.set(x, y, new GridCell(x, y, gridSize));
				}
			}
		}
		
		//public function getNodes(x:int, y:int):NodeList {
		//return GridCell(grid.get(x, y)).nodeList;
		//}
		
		private function addNode(node:SpatialHashingNode):void {
			var left:int = int(Math.floor((node.position.position.x - node.size.size.x / 2) / gridSize));
			var right:int = int(Math.floor((node.position.position.x + node.size.size.x / 2) / gridSize));
			var top:int = int(Math.floor((node.position.position.y - node.size.size.x / 2) / gridSize));
			var bottom:int = int(Math.floor((node.position.position.y + node.size.size.x / 2) / gridSize));
			
			node.spatialHashed.left = left;
			node.spatialHashed.right = right;
			node.spatialHashed.top = top;
			node.spatialHashed.bottom = bottom;
			
			for (var x:int = left; x <= right; x++) {
				for (var y:int = top; y <= bottom; y++) {
					var cell:GridCell = getCell(x, y);
					node.spatialHashed.dllNodes.append(cell.nodes.append(node));
				}
			}
		}
		
		public function getCell(x:int, y:int):GridCell {
			while (x < 0) {
				x += gridWidth;
			}
			while (y < 0) {
				y += gridHeight;
			}
			return GridCell(grid.get(x % gridWidth, y % gridHeight));
		}
		
		private function removeNode(node:SpatialHashingNode):void {
			for (var walker:DLLNode = node.spatialHashed.dllNodes.head; walker; walker = walker.next) {
				DLLNode(walker.val).unlink();
			}
			node.spatialHashed.dllNodes.clear();
		}
		
		private function updateNode(node:SpatialHashingNode, time:Number):void {
			//var rect:Rectangle = Utils.rectFromCenter(node.position.position, node.size.size.x, node.size.size.y);
			
			var left:int = int(Math.floor((node.position.position.x - node.size.size.x / 2) / gridSize));
			var right:int = int(Math.floor((node.position.position.x + node.size.size.x / 2) / gridSize));
			var top:int = int(Math.floor((node.position.position.y - node.size.size.x / 2) / gridSize));
			var bottom:int = int(Math.floor((node.position.position.y + node.size.size.x / 2) / gridSize));
			
			if ((left != node.spatialHashed.left) || (right != node.spatialHashed.right) || (top != node.spatialHashed.top) || (bottom != node.spatialHashed.bottom)) {
				removeNode(node);
				addNode(node);
					//trace("boing");
			}
		
		}
	}
}
