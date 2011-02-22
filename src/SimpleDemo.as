package {
import com.nikdudnik.reactor.Observable;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class SimpleDemo extends Sprite {
	public function SimpleDemo() {
		var mouseMove:Observable = Observable.fromEvent(stage, MouseEvent.MOUSE_MOVE);
		mouseMove
			.skip(1)
			.zip(mouseMove, function(left:MouseEvent, right:MouseEvent):Object {
					return {x1:left.stageX, y1:left.stageY, x2:right.stageX, y2:right.stageY};
				})
			.subscribe(function(o:Object):void {
				var g:Graphics = graphics;
				g.lineStyle(0, 0x000000);
				g.moveTo(o.x1, o.y1);
				g.lineTo(o.x2, o.y2);
			});
	}
}
}
