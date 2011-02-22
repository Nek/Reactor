/**
 * User: nek
 * Date: 2/22/11
 * Time: 04:02
 */
package com.nikdudnik.reactor{
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.Observable;
import com.nikdudnik.reactor.com.nikdudnik.reactor.internal.ObservableEvent;

import flash.events.IEventDispatcher;

	public function observableFromEvent(eventDispatcher:IEventDispatcher, eventName:String):Observable {
		return new Observable(new ObservableEvent(eventDispatcher, eventName));
	}
}
