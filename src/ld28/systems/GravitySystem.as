package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ld28.components.EnergyStorage;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Mover;
	import ld28.components.Position;
	import ld28.GameConfig;
	import ld28.KeyPoll;
	import ld28.nodes.GravityNode;
	
	public class GravitySystem extends ListIteratingSystem {
		private var config:GameConfig;
		
		public function GravitySystem(config:GameConfig) {
			this.config = config;
			super(GravityNode, updateNode);
		}
		
		private function updateNode(node:GravityNode, time:Number):void {
			var position:Position = node.position;
			var motion:Motion = node.motion;
			
			var diff:Point = (new Point(config.width / 2, config.height / 2)).subtract(position.position);
			diff.normalize(10 * time);
			position.position.x += diff.x;
			position.position.y += diff.y;
		}
	}
}
