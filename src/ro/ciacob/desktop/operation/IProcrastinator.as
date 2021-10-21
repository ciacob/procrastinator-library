package ro.ciacob.desktop.operation {

	/**
	* Procrastinates (delays) performing an action for a time period, unless told to keep procrastinating
	* in the mean time. Should this happen, a new, whole, waiting period is potentially added to the
	* already elapsed time.
	*
	* Especially usefull for intensivelly computational tasks, which run best when the application is
	* "iddle" from a user perspective: in this case, each user interraction will tell a Procrastinator to
	* keep procrastinating.
	*/
	public interface IProcrastinator {
		
		/**
		 * Returns the function to execute when procrastination ends. This must be set via a constructor
		 * argument.
		 */
		function get action():Function;
		
		/**
		 * Returns the context to execute the `action` function in. Defaults to an empty, anonymous object
		 * if not given. This must be set via a constructor argument.
		 */
		function get actionContext():Object;
		
		/**
		 * Returns the minimum time, in milliseconds, to wait before executing the `action` previously specified. Each new call
		 * to `procrastinate()` adds at most this period of time to the procrastination. This must be set 
		 * via a constructor argument.
		 */
		function get waitTime():int;

		/**
		 * Makes the current implementor's instance unusable, by deleting the `action`, `waitTime`
		 * and the internal countdown timer. Further API calls will be ignored. 
		 */
		function abort():void;
		
		/**
		 * Executes the `action` and resets and stops the internal countdown timer. A call to `procrastinate()` is
		 * needed to start procrastinating again.
		 */
		function doItNow():void;
		
		/**
		 * Resets and stops the internal countdown timer, without executing the `action`. A call to `procrastinate()`
		 * is needed to start procrastinating again; `doItNow()` can be called directly.
		 */		
		function leaveItForNow():void;

		/**
		 * Stops the internal countdown timer, resets it, and starts it anew. The `waitTime` lost this way is
		 * never recuperated. E.g., let's say you have a `waitTime` of 2 sec. and you call `procrastinate()` 
		 * after 1 sec. The `action()` function will be executed after 3 sec. of waiting time.
		 */
		function procrastinate():void;
	}
}
