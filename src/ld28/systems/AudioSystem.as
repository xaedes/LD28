package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import flash.media.Sound;
	import ld28.nodes.AudioNode;
	import ld28.nodes.AudioNode;
	import flash.media.Sound;
	public class AudioSystem extends ListIteratingSystem {
		public function AudioSystem() {
			super(AudioNode, updateNode);
		}
		
		private function updateNode(node:AudioNode, time:Number):void {
			for each (var type:Class in node.audio.toPlay) {
				var sound:Sound = new type();
				sound.play(0, 1);
			}
			node.audio.toPlay.length = 0;
		}
	}
}
