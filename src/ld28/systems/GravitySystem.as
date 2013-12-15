package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ld28.components.EnergyStorage;
	import ld28.components.Gravity;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Mover;
	import ld28.components.Position;
	import ld28.GameConfig;
	import ld28.KeyPoll;
	import ld28.nodes.GravityNode;
	
	public class GravitySystem extends ListIteratingSystem {
		
		public function GravitySystem() {
			super(GravityNode, updateNode);
		}
		
		private function updateNode(node:GravityNode, time:Number):void {
			var position:Position = node.position;
			var gravity:Gravity = node.gravity;
			
			var diff:Point = gravity.towards.subtract(position.position);
			diff.normalize(gravity.strength * time);
			position.position.x += diff.x;
			position.position.y += diff.y;
		}
	}
}
