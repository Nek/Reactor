/**
 * User: nek
 * Date: 2/22/11
 * Time: 02:59
 */
package com.nikdudnik.reactor.com.nikdudnik.reactor.internal{
public class SkippingObservable extends BaseObservable {
	private var skipCount:uint;
	public function SkippingObservable(o:IObservable, i:uint = 1) {
		skipCount = i;
		o.subscribe(skipEvent);
	}

	public function skipEvent(event:*):void {
		if (skipCount == 0) super.onNext(event);
		else skipCount --;
	}
}
}
