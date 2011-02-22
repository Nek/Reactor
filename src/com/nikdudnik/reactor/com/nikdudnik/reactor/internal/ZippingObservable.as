/**
 * User: nek
 * Date: 2/22/11
 * Time: 03:03
 */
package com.nikdudnik.reactor.com.nikdudnik.reactor.internal{
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.IObservable;
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.ObservableBase;

public class ZippingObservable extends ObservableBase {
	private var leftValues:Array = [];
	private var rightValues:Array = [];
	private var zip:Function;

	public function ZippingObservable(left:IObservable, right:IObservable, zip:Function) {
		this.zip = zip;
		left.subscribe(onLeft);
		right.subscribe(onRight);
	}

	private function onRight(e:*):void {
		if (leftValues.length > 0 ) super.onNext(zip(leftValues.shift(), e));
		else rightValues.push(e);
	}

	private function onLeft(e:*):void {
		if (rightValues.length > 0 ) super.onNext(zip(rightValues.shift(), e));
		else leftValues.push(e);
	}

}
}
