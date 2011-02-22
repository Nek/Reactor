/**
 * User: nek
 * Date: 2/22/11
 * Time: 02:55
 */
package com.nikdudnik.reactor.com.nikdudnik.reactor.internal{
import flash.events.IEventDispatcher;

public class EventObservable extends BaseObservable {
    function EventObservable(eventDispatcher:IEventDispatcher, eventName:String) {
		eventDispatcher.addEventListener(eventName, onNext);
	}
}
}
