/**
 * User: nek
 * Date: 2/22/11
 * Time: 00:15
 */
package com.nikdudnik.reactor.com.nikdudnik.reactor.internal{
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.IObservable;
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.IObserver;

import mx.collections.ArrayCollection;

public class ObservableBase implements IObservable, IObserver {
	private var subscribers:ArrayCollection = new ArrayCollection([]);

	public function onNext(event:*):void {
		for each(var action:Function in subscribers) {
			action(event);
		}
	}

	public function subscribe(action:Function):void {
		if (subscribers.contains(action)) return;
		subscribers.addItem(action);
	}

}


}
