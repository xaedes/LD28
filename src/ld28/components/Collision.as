package ld28.components {
	import ash.core.Entity;
	import de.polygonal.ds.HashSet;
	import de.polygonal.ds.Set;
	import flash.utils.Dictionary;
	
	public class Collision {
		//public var collidingEntities:Vector.<Entity> = new Vector.<Entity>();
		public var collidingEntities:Dictionary = new Dictionary();
		
		//public var collidingEntities:HashSet = new HashSet(5);
		
		//public var collidingEntities:DLL = new DLL(5);
		
		public function Collision() {
		}
		
		public function clear():void {
			//this.collidingEntities = new Dictionary();
			for (var key:Object in collidingEntities)
				delete collidingEntities[key];
		}
	}
}
