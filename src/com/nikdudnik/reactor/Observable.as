/**
 * User: nek
 * Date: 2/22/11
 * Time: 04:05
 */
package com.nikdudnik.reactor{
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.*;

import flash.events.IEventDispatcher;

public class Observable implements IObservable {
	private var _o:IObservable;
	public function Observable(observable:IObservable) {
		_o = observable;
	}

	public static function fromEvent(eventDispatcher:IEventDispatcher, eventName:String):Observable {
		return new Observable(new EventObservable(eventDispatcher, eventName));
	}

	public function skip(n:uint):Observable {
		var o:IObservable = new SkippingObservable(_o, n);
		return new Observable(o);
	}

	public function zip(right:Observable, f:Function):Observable {
		var o:IObservable = new ZippingObservable(_o, right._o, f);
		return new Observable(o);
	}

	public function subscribe(f:Function):void {
		_o.subscribe(f);
	}
}
}
