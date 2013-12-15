package ld28.components {
	import de.polygonal.ds.DLL;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class SpatialHashed {
		public var dllNodes:DLL = new DLL(10); //stores occurences of SpatialHashingNode in grid
		
		// bounds in grid
		public var left:int;
		public var right:int;
		public var top:int;
		public var bottom:int;
		
		public function SpatialHashed() {
		}
	
	}

}