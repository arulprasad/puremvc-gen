package @namespace@ {
	
	import @namespace@.@ctrls@.*;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.IPipeAware;
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.IPipeFitting;
	import org.puremvc.as3.multicore.utilities.pipes.plumbing.JunctionMediator;
	
	/**
	 * Application Facade.
	 *
	 * @langversion ActionScript 3.0
	 * @author @author.name@ @author.email@
	 * @date @today@
	 * @version @version@
	 */
	public class @app.prefix@Facade extends Facade implements IPipeAware{
	   
		/* --- Variables --- */
		
		public static const STARTUP:String = "startup";

		//pmvcgen:varconsts
		
		/* === Variables === */
		
		/* --- Functions --- */
		
		public static function getInstance(key:String):@app.prefix@Facade {
    	if (instanceMap[key] == null) instanceMap[key] = new @app.prefix@Facade;
			return instanceMap[key] as @app.prefix@Facade;
		}
		
		/**
		 * Starts up @project.name@.
		 *
		 * @param app reference to the application
		 */
		public function startup(app:@project.name@):void {
			sendNotification(STARTUP, app);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			//pmvcgen:register commands
		}
		
		/**
		 * Accept an input pipe.
		 * 
		 * Registers an input pipe with this module's Junction.
		 */
		public function acceptInputPipe( name:String, pipe:IPipeFitting ):void{
			sendNotification(JunctionMediator.ACCEPT_INPUT_PIPE, pipe, name);                            
		}
		
		/**
		 * Accept an output pipe.
		 * 
		 * Registers an input pipe with this module's Junction.
		 */
		public function acceptOutputPipe(name:String, pipe:IPipeFitting):void{
			sendNotification(JunctionMediator.ACCEPT_OUTPUT_PIPE, pipe, name);                            
		}
		
		/* === Functions === */
		
	}
	
}
